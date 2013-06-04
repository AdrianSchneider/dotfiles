call textobj#user#plugin('attribute', {
\   'attribute': {
\     'pattern': '\v\w+\=\"([^"]+)\"',
\     'select': ['iA'],
\   },
\   'an-attribute': {
\     'pattern': '\v\w+\=\"([^"]*)\"(\s*)',
\     'select': ['aA'],
\   }
\ })
