%% Matlab Script to *exercise the Simulink Fixed-point Licence
%% * Not exercising your license will cause you to have them taken away 

%% *nix command line execute with :
%% $ module load matlab/r2009b
%% $ matlab -r "run_exercise_fixedpoint;exit" -nodesktop

%% Run model in integer mode to check it actually works
a_fixdt = 'int32';
try 
  %%   Decide which version of model to run based on Matlab/Simulink Version to avoid warnings.
  matlab_release = version('-release');
  switch matlab_release
      case '2009b'
          sim(  'exercise_fixedpoint_2009b' );
      case '2012b'
          sim(  'exercise_fixedpoint' ); % Uses .slx
      otherwise
          disp( 'Exact version match not created, Falling back to a 2008b version' );
          sim(  'exercise_fixedpoint_2008b' );
  end
  disp('Model ran in integer mode.')
catch
  disp('Caught Error : Can not run model')
end

%% Try catch, to **stop** lic checkout failure halting execution. ie run quit/exit statement.
a_fixdt = fixdt(1,32,16);
try 
  %%   Decide which version of model to run based on Matlab/Simulink Version to avoid warnings.
  matlab_release = version('-release');
  switch matlab_release
      case '2009b'
          sim(  'exercise_fixedpoint_2009b' );
      case '2012b'
          sim(  'exercise_fixedpoint' ); % Uses .slx
      otherwise
          disp( 'Exact version match not created, Falling back to a 2008b version' );
          sim(  'exercise_fixedpoint_2008b' );
  end
catch
  disp('Caught Error : probably no fixed point license for you today')
end

%% Only call quit/exit if called from the command line
%quit


