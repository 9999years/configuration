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
syn keyword pythonBuiltinAttrib .__divmod__ .__ge__ .__dir__ .__rtruediv__
syn keyword pythonBuiltinAttrib .strip .strides .start .swapcase .upper
syn keyword pythonBuiltinAttrib .release .keys .__setattr__ .rjust .isspace
syn keyword pythonBuiltinAttrib .difference_update .__ror__ .stop .sort .count
syn keyword pythonBuiltinAttrib .__rdivmod__ .partition .__abs__
syn keyword pythonBuiltinAttrib .__subclasshook__ .setdefault .__format__
syn keyword pythonBuiltinAttrib .__or__ .__mul__ .conjugate .__neg__ .__xor__
syn keyword pythonBuiltinAttrib .decode .__rrshift__ .from_bytes .__repr__
syn keyword pythonBuiltinAttrib .rfind .obj .to_bytes
syn keyword pythonBuiltinAttrib .symmetric_difference_update .as_integer_ratio
syn keyword pythonBuiltinAttrib .__str__ .endswith .replace .__rxor__
syn keyword pythonBuiltinAttrib .__invert__ .__pow__ .__sub__ .lstrip
syn keyword pythonBuiltinAttrib .__getitem__ .expandtabs .real .issubset
syn keyword pythonBuiltinAttrib .intersection_update .__round__ .__add__
syn keyword pythonBuiltinAttrib .__pos__ .__bool__ .append
syn keyword pythonBuiltinAttrib .symmetric_difference .__ior__ .capitalize
syn keyword pythonBuiltinAttrib .numerator .suboffsets .__sizeof__ .extend
syn keyword pythonBuiltinAttrib .shape .__length_hint__ .__imul__ .imag
syn keyword pythonBuiltinAttrib .casefold .__iand__ .denominator .format
syn keyword pythonBuiltinAttrib .split .popitem .rsplit .fromkeys
syn keyword pythonBuiltinAttrib .__setstate__ .__lt__ .translate
syn keyword pythonBuiltinAttrib .__setformat__ .__int__ .remove .__gt__ .lower
syn keyword pythonBuiltinAttrib .index .isdigit .isprintable .rstrip .__and__
syn keyword pythonBuiltinAttrib .rindex .__setitem__ .update .values
syn keyword pythonBuiltinAttrib .difference .intersection .__reduce_ex__
syn keyword pythonBuiltinAttrib .__init__ .__iadd__ .__rshift__ .__getformat__
syn keyword pythonBuiltinAttrib .__next__ .__iter__ .startswith .__len__
syn keyword pythonBuiltinAttrib .__rpow__ .__delattr__ .cast .__rfloordiv__
syn keyword pythonBuiltinAttrib .__getattribute__ .__eq__ .zfill .isdisjoint
syn keyword pythonBuiltinAttrib .tobytes .__isub__ .nbytes .__le__
syn keyword pythonBuiltinAttrib .__delitem__ .copy .discard .__exit__ .step
syn keyword pythonBuiltinAttrib .center .union .__mod__ .__class__ .format_map
syn keyword pythonBuiltinAttrib .__hash__ .__ne__ .isdecimal .join
syn keyword pythonBuiltinAttrib .__rlshift__ .__new__ .readonly .insert
syn keyword pythonBuiltinAttrib .itemsize .isalnum .__enter__ .f_contiguous
syn keyword pythonBuiltinAttrib .is_integer .encode .__truediv__ .__reversed__
syn keyword pythonBuiltinAttrib .__reduce__ .pop .isidentifier .rpartition
syn keyword pythonBuiltinAttrib .items .isnumeric .istitle .isalpha .__alloc__
syn keyword pythonBuiltinAttrib .__floor__ .ndim .__rsub__ .__floordiv__
syn keyword pythonBuiltinAttrib .clear .__getnewargs__ .maketrans .isupper
syn keyword pythonBuiltinAttrib .add .issuperset .__doc__ .__rmod__ .find
syn keyword pythonBuiltinAttrib .__lshift__ .hex .__index__ .get .__ceil__
syn keyword pythonBuiltinAttrib .ljust .fromhex .__rand__ .__contains__
syn keyword pythonBuiltinAttrib .reverse .__rmul__ .c_contiguous .islower
syn keyword pythonBuiltinAttrib .title .splitlines .bit_length .__trunc__
syn keyword pythonBuiltinAttrib .__radd__ .__float__ .contiguous

if !exists("python_no_builtin_highlight")
  hi def link pythonBuiltinAttrib pythonBuiltin
endif
