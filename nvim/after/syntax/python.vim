if exists('b:loaded_pythoncustomsyntax')
	finish
endif
let b:loaded_pythoncustomsyntax=1

syn keyword pythonExceptions ModuleNotFoundError

syn keyword pythonBuiltin __build_class__ __doc__ __loader__ __name__
syn keyword pythonBuiltin __package__ __spec__
syn keyword pythonBuiltin copyright credits exit license quit

" builtin attributes / methods

syn iskeyword @,.,48-57,_,192-255

syn keyword pythonBuiltinAttrib .__ixor__ .__init_subclass__ .tolist
\ .__divmod__ .__ge__ .__dir__ .__rtruediv__ .strip .strides .start .swapcase
\ .upper .release .keys .__setattr__ .rjust .isspace .difference_update
\ .__ror__ .stop .sort .count .__rdivmod__ .partition .__abs__
\ .__subclasshook__ .setdefault .__format__ .__or__ .__mul__ .conjugate
\ .__neg__ .__xor__ .decode .__rrshift__ .from_bytes .__repr__ .rfind .obj
\ .to_bytes .symmetric_difference_update .as_integer_ratio .__str__ .endswith
\ .replace .__rxor__ .__invert__ .__pow__ .__sub__ .lstrip .__getitem__
\ .expandtabs .real .issubset .intersection_update .__round__ .__add__ .__pos__
\ .__bool__ .append .symmetric_difference .__ior__ .capitalize .numerator
\ .suboffsets .__sizeof__ .extend .shape .__length_hint__ .__imul__ .imag
\ .casefold .__iand__ .denominator .format .split .popitem .rsplit .fromkeys
\ .__setstate__ .__lt__ .translate .__setformat__ .__int__ .remove .__gt__
\ .lower .index .isdigit .isprintable .rstrip .__and__ .rindex .__setitem__
\ .update .values .difference .intersection .__reduce_ex__ .__init__ .__iadd__
\ .__rshift__ .__getformat__ .__next__ .__iter__ .startswith .__len__ .__rpow__
\ .__delattr__ .cast .__rfloordiv__ .__getattribute__ .__eq__ .zfill
\ .isdisjoint .tobytes .__isub__ .nbytes .__le__ .__delitem__ .copy .discard
\ .__exit__ .step .center .union .__mod__ .__class__ .format_map .__hash__
\ .__ne__ .isdecimal .join .__rlshift__ .__new__ .readonly .insert .itemsize
\ .isalnum .__enter__ .f_contiguous .is_integer .encode .__truediv__
\ .__reversed__ .__reduce__ .pop .isidentifier .rpartition .items .isnumeric
\ .istitle .isalpha .__alloc__ .__floor__ .ndim .__rsub__ .__floordiv__ .clear
\ .__getnewargs__ .maketrans .isupper .add .issuperset .__doc__ .__rmod__ .find
\ .__lshift__ .hex .__index__ .get .__ceil__ .ljust .fromhex .__rand__
\ .__contains__ .reverse .__rmul__ .c_contiguous .islower .title .splitlines
\ .bit_length .__trunc__ .__radd__ .__float__ .contiguous

if !exists("python_no_builtin_highlight")
  hi def link pythonBuiltinAttrib pythonBuiltin
endif
