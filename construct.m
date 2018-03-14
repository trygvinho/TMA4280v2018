time_zeta=[[2.698972E-005,2.203882E-005,2.904795E-005,1.103710E-004,5.459599E-004,4.357044E-003,2.587458E-002,0.1784805,1.325216];
    [1.930650E-004 ,1.019742E-004,1.083687E-004,2.217833E-004,6.255805E-004,4.353721E-003,2.484365E-002,0.1993850,1.490285];
    [1.353063E-004,1.354050E-004 ,2.298579E-004,3.070682E-004,8.164700E-004,4.098380E-003,2.619761E-002,0.1969361,1.5990972];
    [1.930669E-004,1.4322996139526367E-004,4.0249712765216827E-004,4.4416822493076324E-004,8.1141479313373566E-004,3.9202012121677399E-003,2.9822135344147682E-002,0.16232632845640182,1.7072210889309645]];
time_mach=[[5.384907E-005,8.327886E-005,2.386495E-004,1.391388E-003,1.126115E-002,6.649106E-002,0.4176556,3.278655,26.85466];
    [1.416169E-004,1.833830E-004,3.354661E-004,1.7977674E-003,1.096354E-002,7.214313E-002 ,0.4233478,3.528427,28.74721];
    [2.157185E-004,2.266578E-004,3.779382E-004,1.606233E-003,1.082327E-002,6.288290E-002,0.4712427,3.645694,29.04523];
    [2.607591e-004,2.749674E-004,4.917718E-004,1.609365E-003,9.742765E-003,6.290021E-002,0.4666254,3.842326,32.08733]];
error_zeta=[[0.11429488435473045,1.4839951223568626E-002,1.8639170963132834E-003,2.3320473870080960E-004,2.9229253733387139E-005,3.7301854765026121E-006,5.4276861760627071E-007,1.4434561323994899E-007,9.6030183360795718E-008];
    [0.11429488435473045,1.4839951223568182E-002,1.8639170963137275E-003,2.3320473870658276E-004,2.9229253729834426E-005,3.7301854765026121E-006,5.4276861005675414E-007,1.4434156270226595E-007,9.4809479378454853E-008];
    [0.11429488435473045,1.4839951223568182E-002,1.8639170963141716E-003,2.3320473870880321E-004,2.9229253729834426E-005,3.7301854804994150E-006,5.4276861716218150E-007,1.4434105599647751E-007,9.4574330589125566E-008];
    [0.11429488435473045,1.4839951223568626E-002,1.8639170963141716E-003,2.3320473871013547E-004,2.9229253722728998E-005,3.7301855031479647E-006,5.4276862382351965E-007,1.4434099071536366E-007,9.4542151884979830E-008]];

time_zeta_omp=[[0.000036001,0.000030121,0.000044614,0.000150906,0.001219368,0.009550856,0.064284861,0.400197925,3.338926235];
    [0.000099374,0.000101361,0.000135714,0.000225183,0.000895094,0.007330196,0.046820106,0.307097476,2.143401977];
    [0.000138108,0.000134924,0.000137012,0.000269782,0.000722529,0.004577659,0.034353925,0.221234553,1.516796345];
    [0.000213927,0.000281453,0.000274571,0.000275683,0.000634262,0.003340300,0.024999322,0.162936686,1.172147093]];


time_mach_omp=[[0.000050826,0.000068208,0.000256745,0.001737284,0.013366556,0.073035533,0.531214783,4.058354441,32.721382901];
    [0.000110758,0.000134891,0.000238974,0.001226744,0.008447876,0.063651873,0.297282666,2.200881174,18.913798867];
    [0.000147192,0.000147905,0.000248110,0.000826439,0.005493736,0.032758936,0.198129987,1.353805836,11.180211812];
    [0.000244418,0.000225082,0.000263520,0.000592694,0.003111476,0.022019334,0.145550134,0.821667762,6.816062111]];


error_zeta_omp=[[0.114294796931950327,0.014839863800788500,0.001863829673533157,0.000233117315920683,0.000029141830953261,0.000003642762696376,0.000000455345837480,0.000000056922833114,0.000000008607403235];
    [0.114294796931950327,0.014839863800788056,0.001863829673533601,0.000233117315926457,0.000029141830949708,0.000003642762696376,0.000000455345829931,0.000000056918782576,0.000000007386699252];
    [0.114294796931950327,0.014839863800788056,0.001863829673534045,0.000233117315928677,0.000029141830949708,0.000003642762700373,0.000000455345837036,0.000000056918275870,0.000000007151550463];
    [0.114294796931950327,0.014839863800788500,0.001863829673534045,0.000233117315930009,0.000029141830942603,0.000003642762723022,0.000000455345843697,0.000000056918210589,0.000000007119371759]];

aksis=[8,64,512,4096,32768,262144,2097152,16777216,134217728];
figure(1)
for i=1:4
    loglog(aksis,time_zeta(i,:))
    axis([8 134217728 1e-5 inf])
    xlabel('n')
    ylabel('Timing for zeta1')
    hold on
end
legend('1 Processor','2 Processors','4 Processors','8 Processors')
hold off
figure(2)
for i=1:4
    loglog(aksis,time_mach(i,:))
    axis([8 134217728 1e-5 inf])
    xlabel('n')
    ylabel('Timing for mach1')
    hold on
end
legend('1 Processor','2 Processors','4 Processors','8 Processors')
hold off
figure(3)
for i=1:4
    loglog(aksis,error_zeta(i,:))
    axis([8 134217728 0 inf])
    xlabel('n')
    ylabel('Error for zeta1')
    hold on 
end
legend('1 Processor','2 Processors','4 Processors','8 Processors')
hold off

figure(4)
for i=1:4
    loglog(aksis,time_zeta_omp(i,:))
    axis([8 134217728 1e-5 inf])
    xlabel('n')
    ylabel('Timing for zeta2')
    hold on
end
legend('1 Thread','2 Threads','4 Threads','8 Threads')
hold off
figure(5)
for i=1:4
    loglog(aksis,time_mach_omp(i,:))
    axis([8 134217728 1e-5 inf])
    xlabel('n')
    ylabel('Timing for mach2')
    hold on
end
legend('1 Thread','2 Threads','4 Threads','8 Threads')
hold off
figure(6)
for i=1:4
    loglog(aksis,error_zeta_omp(i,:))
    axis([8 134217728 0 inf])
    xlabel('n')
    ylabel('Error for zeta2')
    hold on 
end
legend('1 Thread','2 Threads','4 Threads','8 Threads')
hold off