# EDDP Benchmarks
A set of benchmarks to test the performance of ephemeral data-derived potentials on a variety of systems

Requires the EDDP software suite - at least `ramble`, which is part of the `repose` package - to be installed. It can be obtained under a GPL-2 license on the [Materials Theory Group website](https://www.mtg.msm.cam.ac.uk/Codes/EDDP).

usage: `./bench.sh <list of number of cores>`

Currently contained benchmarks:
- C:
	- Potential: the potential used to generate figure 4b in P. T. Salzbrenner *et al.*: Developments and Further Applications of Ephemeral Data Derived Potentials
	- System: Cell with 800 atoms of Carbon and a density of 2 g cm<sup>-3</sup>
- Pb:
	- Potential: the SOC potential from section V.B in P. T. Salzbrenner *et al.*: Developments and Further Applications of Ephemeral Data Derived Potentials
	- System: solid-liquid coexistence with 2040 atoms in total at 0 GPa
- ScH:
	- Potential: the potential used to run MD in section V.C in P. T. Salzbrenner *et al.*: Developments and Further Applications of Ephemeral Data Derived Potentials
	- System: ScH<sub>12</sub> at 300 GPa
- ZnC2N2:
	- Potential: the potential used in section V.D of P. T. Salzbrenner *et al.*: Developments and Further Applications of Ephemeral Data Derived Potentials
	- System: the lcs MOF
