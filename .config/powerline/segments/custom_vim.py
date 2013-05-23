from __future__ import absolute_import, division
from powerline.bindings.vim import vim_get_func

venv_func = vim_get_func("virtualenv#statusline", rettype=str)


def virtualenv(pl, *args, **kwargs):
    try:
        venv = venv_func() or None
    except:
        venv = None
    return venv
