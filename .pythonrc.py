from sys import version_info
if version_info.major >= 3:
    try:
        from see import see
    except:
        pass # bad :)

import copy
import functools
import itertools
import math
import operator
from pprint import pprint
import random

# just to be able to use fn OR functools
# may have used two imports...
fn = functools
it = itertools
op = operator
