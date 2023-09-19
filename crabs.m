function crabs ()
 % crabs is a kids computer game where a fishermam, called the captain, hunts for a very clever crab.
 % To run the code type crabs in the command window and click the command window.

 % Your left hand controls the captan
 % w = forward d = trun clockwise a = trun counter clockwise.

 % Your right hand controls the crab
 % j = move left k = move right i = trun clockwise k= trun counter clockwise.

 % The code consists of a single while loop which reads the keyboard and responds.

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     setup: define and initialize local variables         %%%%%%%%%%%%%%%%%%%%%%%%%%%

  %initialize command and map dimensions and draw map
   cmd = "null";
   [mapHeight,mapWidth] = drawMap("BGImage.png");

  %initialize captain location, heading and size
    xCapt = 1000;
    yCapt = 500;
    thetaCapt = -pi/2;
    sizeCapt = 50;


  %initialize crab location, heading and size
    xCrab = 1000;
    yCrab = 1200;
    thetaCrab = -pi/2;
    sizeCrab = 50;

  %initialize graphics handles by drawing the captain and crab
   captGraphics = drawCapt(xCapt,yCapt,thetaCapt,sizeCapt);
   crabGraphics = drawCrab(xCrab,yCrab,thetaCrab,sizeCrab);

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%            main loop        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  while ( cmd != "q") % while not quit read keyboard and respond

    %read the keyboard. Note, command window must be selected.
     cmd = kbhit();

    %respond to keyboard commands
     if( cmd == "w" || cmd == "a" || cmd == "d" ) %captain has moved

       %erase old captain
        for i=1:length(captGraphics)
          set(captGraphics(i),'Visible','off');
        endfor

        %move capt
        [xCapt,yCapt,thetaCapt] = moveCapt(cmd,xCapt,yCapt,thetaCapt,sizeCapt, mapHeight, mapWidth);


        %draw new capt
        captGraphics = drawCapt(xCapt,yCapt,thetaCapt,sizeCapt);

     elseif (cmd == "i" || cmd == "j" || cmd == "k" || cmd == "l" || cmd ==",")  % crab has moved

        %erase old crab
        for i=1:length(crabGraphics)
          set(crabGraphics(i),'Visible','off');
        endfor

        %move crab
        [xCrab,yCrab,thetaCrab] = moveCrab(cmd,xCrab,yCrab,thetaCrab,sizeCrab, mapHeight, mapWidth);

        %draw new captain and crab
        crabGraphics = drawCrab(xCrab,yCrab,thetaCrab,sizeCrab);

     endif


endwhile

close all
clear

endfunction
