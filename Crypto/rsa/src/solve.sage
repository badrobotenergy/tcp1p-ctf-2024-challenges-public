from coppersmith.coppersmith_multivariate_heuristic import coppersmith_multivariate_heuristic
from libnum import n2s
n=13986357905153484822874300783445968480194277882812317554826224241536479785567487956712558237728345348661360577246137576216953724039680969623887884690471844396542763308129517234365819619617071449273126659007918716307793788623728052337632935762139796688014791419718949572448772521789488223910450877828732015095423443037519388747356327730350934152781671783952028215703864406564741666179193772037496984854699143314813242721157017296866888522135989818414587193505121794302821401677072507471357592358012342178011963104524959087968374300060349343826214249928530346877968114749229074874962737714935221065368318487049394644831
h=10474216468878927114435400909130676124750910912012236182806861194655854223324539867768381265996955193355030239325750528328250897464859373863289680002879536341349759323910048168674147097644573874679268018966497862685092382336865554114348153248267599439087357199554652601126191061921516650448119261614064051599968120061991607030873881013657693987836636730528537557619595799676312850875727477092697270452300532360780188724484703363561848754770976459
hpq=492124417091708682668644108145880307537308922842816506360717440112116492381514432506339907757228214359689270777951081610062506962769167209
c=4715651972688371479449666526727240348158670108161494767004202259402013317642418593561463200947908841531208327599049414587586292570298317049448560403558027904798159589477994992384199008976859139072407664659830448866472863679123027179516506312536814186903687358198847465706108667279355674105689763404474207340186200156662095468249081142604074167178023479657021133754055107459927667597604156397468414872149353231061997958301747136265344906296373544580143870450924707559398134384774201700278038470171319329716930036843839101955981274793386611943442507144153946307781795085665793554799349509983282980591388585613674226899

hbits = 567
pqbits = 567
P.<x,y,z> = PolynomialRing(Zmod(n))

hx = (h <<hbits) + x
ax = y
pqx = (hpq << pqbits) + z - 1

g = hx*ax*pqx + 65537 - hx

rs1 = coppersmith_multivariate_heuristic(g, [2**(hbits), 2**18, 2**(pqbits)], beta = 1)
dinvg = int(rs1[0][0]) + (h << hbits)
dg = pow(int(dinvg), -1, n)
print(n2s(int(pow(c, dg, n))))