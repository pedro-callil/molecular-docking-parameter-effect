Programas e arquivos utilizados no projeto "Análise dos Efeitos dos Parâmetros de Simulação em _Docking_ Molecular"
===================================================================================================================

Nesse repositório temos os arquivos (`.pdb`, `.sdf`, `.top`, entre outros)
[[1]](#1), [[2]](#2) que armazenam as moléculas (receptores e ligantes) utilizados
no projeto.

Além disso, temos alguns _scripts_ para automatizar o processo de conversão
dos arquivos fornecidos para um formato utilizável pelo programa
_AutoDock Vina_[[3]](#3), utilizando o programa _OpenBabel_[[4]](#4),
e também para automatizar as simulações de _docking_ em grande
quantidade de sistemas receptor-ligante.

Por fim, temos _scripts_ para automatizar a execução de simulações
de dinâmica molecular com o uso do GROMACS [[5]](#5); no momento, apenas
para a simulação de proteínas em água. Planeja-se a simulação de alguns
complexos proteína-ligante, no futuro.

Execução & _Software_ Utilizado
-------------------------------

Para refazer os cálculos utilizados, é necessário
[PyMOL](https://pymol.org/2/),
[GROMACS](https://www.gromacs.org/),
[OpenBabel](https://openbabel.org/wiki/Main_Page),
[Autodock Vina](https://vina.scripps.edu/) e
[GNU Datamash](https://www.gnu.org/software/datamash/).
Além disso, os _scripts_
exigem um ambiente GNU/Linux (com utilidades como `sed`, `awk`,
`head`, _etc._, além do sistema de arquivos `/proc`), Python e
Bash.

Além disso, talvez sejam necessárias algumas modificações em alguns _scripts_
para lidar com peculiaridades de cada máquina (memória disponível, número
de CPUs, entre outros).

Caso essa verificação seja desejada, basta clonar esse repositório e
executar os _scripts_ relevantes.

```
$ git clone https://github.com/pedro-callil/molecular-docking-parameter-effect
```

Para avaliação dos efeitos de cargas e adição de hidrogênios:

```
$ ./bin/add_charges_and_hydrogen.sh
$ ./bin/add_charges_ligand_no_hydrogens.sh

$ ./bin/create_dir_for_charge_comparison.sh

$ ./bin/dock_in_bulk.sh
$ ./bin/dock_in_bulk_nohydrogen.sh

$ ./bin/get_all_affinities.sh
$ ./bin/get_all_RMSDs.sh
```

Resultados estarão disponíveis nos arquivos `*.results` (RMSDs) e `*.affinities`
de cada subdiretório do diretório `./files_for_charge_comparison/`.

Para avaliação dos efeitos da inserção de resíduos faltantes e pontes de
dissulfeto através de CHARMM-GUI:

```
$ ./bin/add_charges_and_hydrogen_for_rcsb_default.sh
$ ./bin/add_charges_and_hydrogen_for_rcsb_disulfide.sh
$ ./bin/add_charges_and_hydrogen_for_rcsb_nocorrection.sh

$ ./bin/create_dir_for_rcsb_files_charge_comparison.sh

$ ./bin/dock_in_bulk_rcsb.sh

$ ./bin/get_all_affinities_charmm.sh
$ ./bin/get_all_RMSDs_charmm.sh
```

Resultados estarão disponíveis nos arquivos `*.results` (RMSDs) e `*.affinities`
de cada subdiretório do diretório `./files_from_rcsb/files_for_charge_comparison/`.

Para simulações de dinâmica molecular com o uso de GROMACS, basta executar dentro
de cada subdiretório do diretório `./GROMACS/` o _script_ em Bash nele contido.
Por exemplo:

```
cd GROMACS
cd 1a30
./1a30_gromacs.sh
```

Importante ressaltar que os sistemas de código RCSB 1A30, 3CYX e 4DJR exigem a
instalação do campo de forças
[Charmm 36](https://mackerell.umaryland.edu/charmm_ff.shtml#gromacs).

Autoria (_Scripts_)
-------------------

Pedro Callil <pedrocallil@usp.br>

Referências
-----------

<a id="1">[1]</a>
SU, M. et al. Comparative assessment of scoring functions: the casf-2016 update. Journal
of chemical information and modeling, ACS Publications, v. 59, n. 2, p. 895–913, 2018.


<a id="2">[2]</a>
S. Jo, T. Kim, V.G. Iyer, and W. Im (2008). CHARMM-GUI: A Web-based Graphical User
Interface for CHARMM. J. Comput. Chem. 29:1859-1865

<a id="3">[3]</a>
TROTT, O.; OLSON, A. J. Autodock vina: improving the speed and accuracy of docking
with a new scoring function, efficient optimization, and multithreading. Journal of
computational chemistry, Wiley Online Library, v. 31, n. 2, p. 455–461, 2010.

<a id="4">[4]</a>
O’BOYLE, N. M. et al. Open babel: An open chemical toolbox. Journal of cheminformatics,
BioMed Central, v. 3, n. 1, p. 1–14, 2011.

<a id="5">[5]</a>
BERENDSEN, H. J.; SPOEL, D. van der; DRUNEN, R. van. Gromacs: a message-passing
parallel molecular dynamics implementation. Computer physics communications, Elsevier,
v. 91, n. 1-3, p. 43–56, 1995.
