function [sys,x0,str,ts] = SetObjectPosition(t,x,u,flag,vrep,clientID,object_name,relative_object_name)
    switch flag
        case 0
            [sys,x0,str,ts]=mdlInitializeSizes;
        case 1
            sys=mdlDerivatives(t,x,u);    
        case 2
			sys=mdlUpdate(t,x,u,vrep,clientID,object_name,relative_object_name);
        case 3
			sys=mdlOutputs(t,x,u)
        case {4,9}
            sys=[];
        otherwise
            error(['Unhandled flag = ',num2str(flag)]);
    end
end

function [sys,x0,str,ts] = mdlInitializeSizes
    sizes = simsizes;           
    sizes.NumContStates  = 0;   
    sizes.NumDiscStates  = 0;
    sizes.NumOutputs     = 0;
    sizes.NumInputs      = 3;
    sizes.DirFeedthrough = 1;
    sizes.NumSampleTimes = 1;
    sys = simsizes(sizes); 
    x0  = [];
    str = [];
    ts  = [0 0];
end

function sys = mdlUpdate(t,x,u,vrep,clientID,object_name,relative_object_name)
    [~, object_handle] = vrep.simxGetObjectHandle(clientID, object_name, vrep.simx_opmode_blocking);
    
    if strcmp(relative_object_name, 'world')
        relative_handle = -1;
    elseif strcmp(relative_object_name, 'parent')
        relative_handle = vrep.sim_handle_parent;
    else
        [~, relative_handle] = vrep.simxGetObjectHandle(clientID, relative_object_name, vrep.simx_opmode_blocking);
    end

    vrep.simxSetObjectPosition(clientID, object_handle, relative_handle, [u(1),u(2),u(3)], vrep.simx_opmode_oneshot);     %AD

	sys = [];
end

function sys = mdlOutputs(t,x,u)
    sys = [];
end