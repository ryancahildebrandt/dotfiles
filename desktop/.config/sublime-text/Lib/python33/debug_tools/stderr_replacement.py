#! /usr/bin/env python
# -*- coding: utf-8 -*-

####################### Licensing #######################################################
#
#   Copyright 2018 @ Evandro Coan
#   Helper functions and classes
#
#  Redistributions of source code must retain the above
#  copyright notice, this list of conditions and the
#  following disclaimer.
#
#  Redistributions in binary form must reproduce the above
#  copyright notice, this list of conditions and the following
#  disclaimer in the documentation and/or other materials
#  provided with the distribution.
#
#  Neither the name Evandro Coan nor the names of any
#  contributors may be used to endorse or promote products
#  derived from this software without specific prior written
#  permission.
#
#  This program is free software; you can redistribute it and/or modify it
#  under the terms of the GNU General Public License as published by the
#  Free Software Foundation; either version 3 of the License, or ( at
#  your option ) any later version.
#
#  This program is distributed in the hope that it will be useful, but
#  WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
#  General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#########################################################################################
#

# Warning message here
import sys
import logging

import inspect
import traceback

from logging import StreamHandler

try:
    unicode
    _unicode = True
except NameError:
    unicode = str
    _unicode = False


class stderr_replacement(object):
    """
        In case of reloading this module, never recapture the current `sys.stderr`.

        When disabling this with unlock, it will only restore the standard behavior of the `stderr`
        stream. However, the attached logger will cannot be detached never because someone else can
        have a reference to its older version. This is why this is a global singleton which can
        never dies.

        How do I duplicate sys.stdout to a log file in python?
        https://stackoverflow.com/questions/616645/how-do-i-duplicate-sys-stdout-to-a-log-file-in-python

        How to redirect stdout and stderr to logger in Python
        https://stackoverflow.com/questions/19425736/how-to-redirect-stdout-and-stderr-to-logger-in-python

        Set a Read-Only Attribute in Python?
        https://stackoverflow.com/questions/24497316/set-a-read-only-attribute-in-python
    """
    is_active = False

    @classmethod
    def lock(cls, logger):
        """
            Attach this singleton logger to the `sys.stderr` permanently.
        """
        global _stderr_singleton
        global _stderr_default
        global _stderr_default_class_type

        # On Sublime Text, the `sys.__stderr__` is None, because they already replaced `sys.stderr`
        # by some `_LogWriter()` class, then just save the current one over there.
        if not sys.__stderr__:
            sys.__stderr__ = sys.stderr

        try:
            _stderr_default
            _stderr_default_class_type

        except NameError:
            # sys.stdout.write( "Assigning sys.stderr to _stderr_default\n" )
            _stderr_default = sys.stderr

            _stderr_default_class_type = type( _stderr_default )
            # sys.stdout.write( "Assigned  sys.stderr to _stderr_default: %s, %s\n" % ( _stderr_default, _stderr_default_class_type ) )

        # Recreate the sys.stderr logger when it was reset by `unlock()`
        if not cls.is_active:
            cls.is_active = True
            _stderr_write = _stderr_default.write

            logger_call = logger._log_clean
            clean_formatter = logger.clean_formatter

            global _sys_stderr_write
            global _sys_stderr_write_hidden

            if sys.version_info <= (3,2):

                def customEmit(self, record):
                    """
                    Emit a record.
                    https://stackoverflow.com/questions/12699645/how-can-i-suppress-newline-in-python-logging-module

                    If a formatter is specified, it is used to format the record.
                    The record is then written to the stream with a trailing newline.  If
                    exception information is present, it is formatted using
                    traceback.print_exception and appended to the stream.  If the stream
                    has an 'encoding' attribute, it is used to determine how to do the
                    output to the stream.
                    """
                    try:
                        msg = self.format(record)
                        stream = self.stream
                        fs = "%s%s"
                        if not _unicode: #if no unicode support...
                            stream.write(fs % (msg, self.terminator))
                        else:
                            try:
                                if (isinstance(msg, unicode) and
                                    getattr(stream, 'encoding', None)):
                                    ufs = u'%s%s'
                                    try:
                                        stream.write(ufs % (msg, self.terminator))
                                    except UnicodeEncodeError:
                                        #Printing to terminals sometimes fails. For example,
                                        #with an encoding of 'cp1251', the above write will
                                        #work if written to a stream opened or wrapped by
                                        #the codecs module, but fail when writing to a
                                        #terminal even when the codepage is set to cp1251.
                                        #An extra encoding step seems to be needed.
                                        stream.write((ufs % (msg, self.terminator)).encode(stream.encoding))
                                else:
                                    stream.write(fs % (msg, self.terminator))
                            except UnicodeError:
                                stream.write(fs % (msg.encode("UTF-8"), self.terminator))
                        self.flush()
                    except (KeyboardInterrupt, SystemExit):
                        raise
                    except:
                        self.handleError(record)

                logging.StreamHandler.terminator = '\n'
                setattr(StreamHandler, StreamHandler.emit.__name__, customEmit)

            # Always recreate/override the internal write function used by `_sys_stderr_write`
            def _sys_stderr_write_hidden(msg, *args, **kwargs):
                """
                    Suppress newline in Python logging module
                    https://stackoverflow.com/questions/7168790/suppress-newline-in-python-logging-module
                """

                try:
                    file = logger._file
                    _stderr_write( msg, *args, **kwargs )

                    formatter = file.formatter
                    terminator = file.terminator

                    file.formatter = clean_formatter
                    file.terminator = ""

                    kwargs['extra'] = { '_duplicated_from_file': True }
                    logger_call( msg, args, kwargs )

                    file.formatter = formatter
                    file.terminator = terminator

                except Exception:
                    logger.exception( "Could not write to the file: %s(%s)", file, logger )
                    cls.unlock()

            # Only create one `_sys_stderr_write` function pointer ever
            try:
                _sys_stderr_write

            except NameError:

                def _sys_stderr_write(*args, **kwargs):
                    """
                        Hides the actual function pointer. This allow the external function pointer to
                        be cached while the internal written can be exchanged between the standard
                        `sys.stderr.write` and our custom wrapper around it.
                    """
                    _sys_stderr_write_hidden( *args, **kwargs )

        # sys.stdout.write( "_stderr_default: %s\n" % _stderr_default )
        # sys.stdout.write( "_stderr_default.__dict__: %s\n" % dir( _stderr_default ) )
        # sys.stdout.write( "(inspect) _stderr_default.__init__: %s\n" % str( inspect.getfullargspec( _stderr_default.__init__ ) ) )

        try:
            # Only create one singleton instance ever
            # del _stderr_singleton
            _stderr_singleton

        except NameError:

            class stderr_replament_hidden(_stderr_default_class_type):
                """
                    Which special methods bypasses __getattribute__ in Python?
                    https://stackoverflow.com/questions/12872695/which-special-methods-bypasses-getattribute-in-python
                """

                if hasattr( _stderr_default, "__abstractmethods__" ):
                    __abstractmethods__ = _stderr_default.__abstractmethods__

                if hasattr( _stderr_default, "__base__" ):
                    __base__ = _stderr_default.__base__

                if hasattr( _stderr_default, "__bases__" ):
                    __bases__ = _stderr_default.__bases__

                if hasattr( _stderr_default, "__basicsize__" ):
                    __basicsize__ = _stderr_default.__basicsize__

                if hasattr( _stderr_default, "__call__" ):
                    __call__ = _stderr_default.__call__

                if hasattr( _stderr_default, "__class__" ):
                    __class__ = _stderr_default.__class__

                if hasattr( _stderr_default, "__delattr__" ):
                    __delattr__ = _stderr_default.__delattr__

                if hasattr( _stderr_default, "__dict__" ):
                    __dict__ = _stderr_default.__dict__

                if hasattr( _stderr_default, "__dictoffset__" ):
                    __dictoffset__ = _stderr_default.__dictoffset__

                if hasattr( _stderr_default, "__dir__" ):
                    __dir__ = _stderr_default.__dir__

                if hasattr( _stderr_default, "__doc__" ):
                    __doc__ = _stderr_default.__doc__

                if hasattr( _stderr_default, "__eq__" ):
                    __eq__ = _stderr_default.__eq__

                if hasattr( _stderr_default, "__flags__" ):
                    __flags__ = _stderr_default.__flags__

                if hasattr( _stderr_default, "__format__" ):
                    __format__ = _stderr_default.__format__

                if hasattr( _stderr_default, "__ge__" ):
                    __ge__ = _stderr_default.__ge__

                if hasattr( _stderr_default, "__getattribute__" ):
                    __getattribute__ = _stderr_default.__getattribute__

                if hasattr( _stderr_default, "__gt__" ):
                    __gt__ = _stderr_default.__gt__

                if hasattr( _stderr_default, "__hash__" ):
                    __hash__ = _stderr_default.__hash__

                if hasattr( _stderr_default, "__init__" ):
                    __init__ = _stderr_default.__init__

                if hasattr( _stderr_default, "__init_subclass__" ):
                    __init_subclass__ = _stderr_default.__init_subclass__

                if hasattr( _stderr_default, "__instancecheck__" ):
                    __instancecheck__ = _stderr_default.__instancecheck__

                if hasattr( _stderr_default, "__itemsize__" ):
                    __itemsize__ = _stderr_default.__itemsize__

                if hasattr( _stderr_default, "__le__" ):
                    __le__ = _stderr_default.__le__

                if hasattr( _stderr_default, "__lt__" ):
                    __lt__ = _stderr_default.__lt__

                if hasattr( _stderr_default, "__module__" ):
                    __module__ = _stderr_default.__module__

                if hasattr( _stderr_default, "__mro__" ):
                    __mro__ = _stderr_default.__mro__

                if hasattr( _stderr_default, "__name__" ):
                    __name__ = _stderr_default.__name__

                if hasattr( _stderr_default, "__ne__" ):
                    __ne__ = _stderr_default.__ne__

                if hasattr( _stderr_default, "__new__" ):
                    __new__ = _stderr_default.__new__

                if hasattr( _stderr_default, "__prepare__" ):
                    __prepare__ = _stderr_default.__prepare__

                if hasattr( _stderr_default, "__qualname__" ):
                    __qualname__ = _stderr_default.__qualname__

                if hasattr( _stderr_default, "__reduce__" ):
                    __reduce__ = _stderr_default.__reduce__

                if hasattr( _stderr_default, "__reduce_ex__" ):
                    __reduce_ex__ = _stderr_default.__reduce_ex__

                if hasattr( _stderr_default, "__repr__" ):
                    __repr__ = _stderr_default.__repr__

                if hasattr( _stderr_default, "__setattr__" ):
                    __setattr__ = _stderr_default.__setattr__

                if hasattr( _stderr_default, "__sizeof__" ):
                    __sizeof__ = _stderr_default.__sizeof__

                if hasattr( _stderr_default, "__str__" ):
                    __str__ = _stderr_default.__str__

                if hasattr( _stderr_default, "__subclasscheck__" ):
                    __subclasscheck__ = _stderr_default.__subclasscheck__

                if hasattr( _stderr_default, "__subclasses__" ):
                    __subclasses__ = _stderr_default.__subclasses__

                if hasattr( _stderr_default, "__subclasshook__" ):
                    __subclasshook__ = _stderr_default.__subclasshook__

                if hasattr( _stderr_default, "__text_signature__" ):
                    __text_signature__ = _stderr_default.__text_signature__

                if hasattr( _stderr_default, "__weakrefoffset__" ):
                    __weakrefoffset__ = _stderr_default.__weakrefoffset__

                if hasattr( _stderr_default, "mro" ):
                    mro = _stderr_default.mro

                def __init__(self):
                    """
                        Override any super class `type( _stderr_default )` constructor, so we can
                        instantiate any kind of `sys.stderr` replacement object, in case it was
                        already replaced by something else like on Sublime Text with `_LogWriter()`.

                        Assures all attributes were statically replaced just above. This should happen in case
                        some new attribute is added to the python language.

                        This also ignores the only two methods which are not equal, `__init__()` and `__getattribute__()`.
                    """
                    different_methods = ("__init__", "__class__", "__getattribute__")
                    attributes_to_check = set( dir( object ) + dir( type ) )

                    for attribute in attributes_to_check:

                        if attribute not in different_methods \
                                and hasattr( _stderr_default, attribute ):

                            base_class_attribute = super( _stderr_default_class_type, self ).__getattribute__( attribute )
                            target_class_attribute = _stderr_default.__getattribute__( attribute )

                            if base_class_attribute != target_class_attribute:
                                sys.stderr.write( "    The base class attribute `%s` is different from the target class:\n%s\n%s\n\n" % ( attribute, base_class_attribute, target_class_attribute ) )

                def __getattribute__(self, item):
                    # sys.stdout.write( "__getattribute__, item: %s: %s\n" % ( item, _sys_stderr_write ) )

                    if item == 'write':
                        return _sys_stderr_write

                    try:
                        return _stderr_default.__getattribute__( item )

                    except AttributeError:
                        return super( _stderr_default_class_type, _stderr_default ).__getattribute__( item )

            # sys.stdout.write( "_stderr_default: %s\n" % _stderr_default )
            # sys.stdout.write( "inspect.getmro(_stderr_default): %s\n" % str( inspect.getmro( type( _stderr_default ) ) ) )
            # sys.stdout.write( "inspect.getmro(stderr_replacement): %s\n" % str( inspect.getmro( stderr_replament_hidden ) ) )
            # sys.stdout.write( "traceback.format_stack():\n%s\n" % "".join( traceback.format_stack() ) )
            _stderr_singleton = stderr_replament_hidden()

            # sys.stdout.write( "_stderr_singleton: ")
            # sys.stdout.write( "%s\n" % _stderr_singleton )
            sys.stderr = _stderr_singleton

            # sys.stdout.write( "(inspect) signature:   %s\n" % str( inspect.signature( _stderr_singleton.write ) ) )
            # sys.stdout.write( "(inspect) fullargspec: %s\n" % str( inspect.getfullargspec( _stderr_singleton.write ) ) )
            # sys.stdout.write( "(_stderr_singleton 6): %s\n" % _stderr_singleton )

        # sys.stdout.write( "Locking...   _sys_stderr_write_hidden: %s\n" % _sys_stderr_write_hidden )
        return cls

    @classmethod
    def unlock(cls):
        """
            Detach this `stderr` writer from `sys.stderr` and allow the next call to `lock()` create
            a new writer for the stderr.
        """

        if cls.is_active:
            global _sys_stderr_write_hidden
            # sys.stdout.write( "Unlocking... _sys_stderr_write_hidden: %s\n" % _sys_stderr_write_hidden )

            cls.is_active = False
            _sys_stderr_write_hidden = _stderr_default.write

