<p align="center">
    <a href="https://opensource.org/licenses/BSD-3-Clause"><img src="https://img.shields.io/badge/license-bsd-orange.svg" alt="Licenses"></a>
</p>

# Miller-Rabin_Primality_Test
Implementation of Miller-Rabin probabilistic primality testing algorithm in GAWK(the GNU implementation of the AWK programming language).

# Usage
```bash
/usr/bin/gawk -M -f is_prime3.awk -v Subject=$Subject -v k=$k
```

# Recommended gawk version
* The version of gawk is 4 or later, and the MPFR library has been installed.
* If the version of gawk is 5, the MPFR library may not be installed.
```bash
$ /usr/bin/gawk -V
GNU Awk 4.1.4, API: 1.1 (GNU MPFR 4.0.1, GNU MP 6.1.2)
$
```

