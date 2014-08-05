start_015 = 65535./load('start-015')';
start_031 = 65535./load('start-031')';
start_047 = 65535./load('start-047')';
start_063 = 65535./load('start-063')';
start_079 = 65535./load('start-079')';
start_095 = 65535./load('start-095')';
start_111 = 65535./load('start-111')';
start_127 = 65535./load('start-127')';

plot(1:length(start_015),start_015,'b',
     1:length(start_031),start_031,'b',
     1:length(start_047),start_047,'b',
     1:length(start_063),start_063,'b',
     1:length(start_079),start_079,'b',
     1:length(start_095),start_095,'b',
     1:length(start_111),start_111,'b',
     1:length(start_127),start_127,'b')

%  speed = [
%      start_015 start_015(length(start_015)-1)*ones(1,199-length(start_015));
%      start_031 start_031(length(start_031)-1)*ones(1,199-length(start_031));
%      start_047 start_047(length(start_047)-1)*ones(1,199-length(start_047));
%      start_063 start_063(length(start_063)-1)*ones(1,199-length(start_063));
%      start_079 start_079(length(start_079)-1)*ones(1,199-length(start_079));
%      start_095 start_095(length(start_095)-1)*ones(1,199-length(start_095));
%      start_111 start_111(length(start_111)-1)*ones(1,199-length(start_111));
%      start_127 start_127(length(start_127)-1)*ones(1,199-length(start_127))
%  ];
%  
%  final_speed = mean(speed(:,150:199)')';
%  pwm = 15 + (0:7) * 16;
%  
%  x = 1:199;
%  
%  fit = zeros(8, 199);
%  coeffs = zeros(8, 3);
%  for i = 3:8
%      [a,c,r] = expfit(1, 1, 1, final_speed(i) - speed(i, 1:75));
%      coeffs(i, :) = [a,c,r];
%      fit(i, :) = final_speed(i) - c * exp(a * x);
%  endfor
