figure,
ax(1) = subplot(3,1,1);
plot(sigTest1)
ylabel('sigTest1')
grid on
ax(2) = subplot(3,1,2); 
plot(sigTest2,'k')
ylabel('sigTest2')
grid on
ax(3) = subplot(3,1,3); 
plot(sigTest3,'r')
ylabel('sigTest3')
grid on
xlabel('Samples')
linkaxes(ax,'xy')
t21 = finddelay(sigTest1,sigTest3)
s1 = alignsignals(sigTest1,sigTest3);

figure
ax(1) = subplot(3,1,1);
plot(s1)
grid on 
title('s1')
axis tight
ax(2) = subplot(3,1,2);
plot(s)
grid on 
title('s2')
axis tight
ax(3) = subplot(3,1,3); 
plot(s3)
grid on 
title('s3')
axis tight
linkaxes(ax,'xy')