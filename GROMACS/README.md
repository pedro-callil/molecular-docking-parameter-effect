Proteínas escolhidas para simulações de Dinâmica Molecular
==========================================================

Foram escolhidas, dentre os 90 complexos receptor-ligante analisados
os 15 que apresentaram receptores com menor número de aminoácidos. São esses:

1. Protease do HIV-1 em complexo com inibidor tripeptídico,
   código 1A30 no _Protein Data Bank_. Campo de forças citado na
   literatura: CHARMM36; modelo para a água: TIP3P [[1]](#1).

2. Domínio SH2 da Grb2 em complexo com fosfopeptídeo,
   código 1JYQ. Campo de forças citado na literatura: CHARMM27;
   modelo para a água: TIP3P [[2]](#2).

3. Ribonuclease bovina pancreática A em complexo com 3'-fosfotimidina
   (3'-5')-pirofosfato adenosina 3'-fosfato, código 1U1B. Campo de forças:
   CHARMM27; modelo para a água: TIP3P [[3]](#3).

4. Ribonuclease A em complexo com 3'-nucleotídeos não-naturais, código 1W4O. Campo
   de forças: CHARMM27; modelo para a água: TIP3P [[3]](#3).

5. Hsp90-α humana em complexo com dihidroxifenilpirazole, código  1YC1. Campo
   de forças: GROMOS96 53A6; modelo para a água: SPC [[6]](#6).

6. Hsp90 em complexo com análogo de radicicol, código 2IWX. Campo
   de forças: GROMOS96 53A6; modelo para a água: SPC [[6]](#6).

7. Hsp90 de levedura em complexo com o inibidor 7-O-carbamoilpremacbecina,
   código 2VW5. Campo de forças: GROMOS96 53A6; modelo para a água: SPC [[6]](#6).

8. Mutante E88G-N92L de Hsp90 em complexo com geldanamicina,
   código 2YGE. Campo de forças: GROMOS96 53A6; modelo para a água: SPC [[6]](#6).

9. Série tricíclica de inibidores de Hsp90.
   código 2YKI. Campo de forças: GROMOS96 53A6; modelo para a água: SPC [[6]](#6).

10. Mutante I50V de protease de HIV-1 em complexo com inibidor saquinavira.
   código 3CYX. Campo de forças: CHARMM36; modelo para a água: TIP3P [[1]](#1)

11. Ribonuclease A em complexo com uridina 5'-fosfato, código 3DXG.
   Campo de forças: CHARMM27; modelo para a água: TIP3P [[3]](#3).

12. β-lactoglobulina bovina em complexo com ácido cáprico, código 3NQ3.
   Campo de forças: AMBER99SB; modelo para a água: TIP3P [[7](#7),[4](#4),[5](#5)].

13. Domínio SH2 da Grb2 em complexo com tripeptídeo, código 3OV1. Campo de
   forças citado na literatura: CHARMM27; modelo para a água: TIP3P [[2]](#2).

14. Domínio SH2 da Grb2 em complexo com tripeptídeo, código 3S8O. Campo de
   forças citado na literatura: CHARMM27; modelo para a água: TIP3P [[2]](#2).

15. Protease do HIV-1 em complexo com MKP97, código 4DJR. Campo de forças:
   CHARMM36; modelo para a água: TIP3P [[1]](#1).

Essas proteínas foram simuladas em GROMACS 2021.4, de acordo com os
comandos listados nos _scripts_ `<complexo>_gromacs.sh`, presentes
em cada subdiretório desse diretório.

Foram utilizados como base arquivos `.mdp` escitos por J. Lemkul [[8]](#8),
com algumas modificações, por exemplo para uso do campo de forças CHARMM36,
como descrito na documentação do programa [[9]](#9).

Por fim, existe um campo de forças (`gromos53a6_hsd.ff`) nesse diretório.
Foi criado a partir do campo de forças GROMOS96 53A6, distribuído com o
próprio GROMACS, com uma pequena modificação: ao invés de histidina neutra
protonada em D1 ser simbolizada pela abreviação "HISA", o é por "HSD", para
garantir compatibilidade com arquivos provenientes de CHARMM-GUI [[10]](#10).


Referências
-----------

<a id="1">[1]</a>
Perilla, J. R., & Schulten, K. (2017). Physical properties of the
HIV-1 capsid from all-atom molecular dynamics simulations.
_Nature communications_, 8(1), 1-10.

<a id="2">[2]</a>
Sanches, K., Dias, R. V. R., da Silva, P. H., Fossey, M. A., Caruso, Í. P.,
de Souza, F. P., ... & de Melo, F. A. (2019). Grb2 dimer interacts with
Coumarin through SH2 domains: A combined experimental and molecular
modeling study. _Heliyon_, 5(11), e02869.

<a id="3">[3]</a>
Formoso, E., Matxain, J. M., Lopez, X., & York, D. M. (2010). Molecular
Dynamics Simulation of Bovine Pancreatic Ribonuclease A− CpA and Transition
State-like Complexes. _The Journal of Physical Chemistry B_, 114(21), 7371-7382.

<a id="4">[4]</a>
J. A. Maier; C. Martinez; K. Kasavajhala; L. Wickstrom; K. E. Hauser; C.
Simmerling. ff14SB: Improving the Accuracy of Protein Side Chain and Backbone
Parameters from ff99SB. _J. Chem. Theory Comput._, 2015, 11, 3696–3713.

<a id="5">[5]</a>
V. Hornak; R. Abel; A. Okur; B. Strockbine; A. Roitberg; C. Simmerling.
Comparison of multiple Amber force fields and development of improved
protein backbone parameters. _Proteins_, 2006, 65, 712–725.

<a id="6">[6]</a>
Vettoretti, G., Moroni, E., Sattin, S., Tao, J., Agard, D. A., Bernardi, A., &
Colombo, G. (2016). Molecular dynamics simulations reveal the mechanisms of
allosteric activation of Hsp90 by designed ligands. _Scientific reports_,
6(1), 1-13.

<a id="7">[7]</a>
Zhan, F., Ding, S., Xie, W., Zhu, X., Hu, J., Gao, J., ... & Chen, Y. (2020).
Towards understanding the interaction of β-lactoglobulin with capsaicin:
Multi-spectroscopic, thermodynamic, molecular docking and molecular dynamics
simulation approaches. _Food Hydrocolloids_, 105, 105767.

<a id="8">[8]</a>
J.A. Lemkul (2018). From Proteins to Perturbed Hamiltonians: A Suite of
Tutorials for the GROMACS-2018 Molecular Simulation Package, v1.0. _Living
J. Comp. Mol. Sci._ 1 (1): 5068.

<a id="9">[9]</a>
Berendsen, H. J., van der Spoel, D., & van Drunen, R. (1995). GROMACS: A
message-passing parallel molecular dynamics implementation. _Computer physics
communications_, 91(1-3), 43-56.

<a id="10">[10]</a>
Oostenbrink, C., Villa, A., Mark, A. E., & Van Gunsteren, W. F. (2004).
A biomolecular force field based on the free enthalpy of hydration and
solvation: the GROMOS force‐field parameter sets 53A5 and 53A6. _Journal
of computational chemistry_, 25(13), 1656-1676.

