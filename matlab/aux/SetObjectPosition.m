function [sys,x0,str,ts] = SetObjectPosition(t,x,u,flag,vrep,clientID,object_name,relative_object_name)
    switch flag
        case 0
            [sys,x0,str,ts]=mdlInitializeSizes;
        case 1
            sys=mdlDerivatives(t,x,u);    
        case 2
            % sys=mdlUpdate(t,x,u);    %AD
			sys=mdlUpdate(t,x,u,vrep,clientID,object_name,relative_object_name);
        case 3
            % sys=mdlOutputs(t,x,u,vrep,clientID,object_name,relative_object_name);    %AD
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
%    sizes.NumOutputs     = 6;    %AD	
    sizes.NumOutputs     = 0;
%    sizes.NumInputs      = 0;    %AD
    sizes.NumInputs      = 3;
    sizes.DirFeedthrough = 1;
    sizes.NumSampleTimes = 1;
    sys = simsizes(sizes); 
    x0  = [];
    str = [];
    ts  = [0 0];
end

%function sys = mdlUpdate(~,~,~)     %AD
%    sys = [];
%end

function sys = mdlUpdate(t,x,u,vrep,clientID,object_name,relative_object_name)
    [~, object_handle] = vrep.simxGetObjectHandle(clientID, object_name, vrep.simx_opmode_blocking);
    
    if strcmp(relative_object_name, 'world')
        relative_handle = -1;
    elseif strcmp(relative_object_name, 'parent')
        relative_handle = vrep.sim_handle_parent;
    else
        [~, relative_handle] = vrep.simxGetObjectHandle(clientID, relative_object_name, vrep.simx_opmode_blocking);
    end

    % [~, position] = vrep.simxGetObjectPosition(clientID, object_handle, relative_handle, vrep.simx_opmode_blocking);     % AD
    vrep.simxSetObjectPosition(clientID, object_handle, relative_handle, [u(1),u(2),u(3)], vrep.simx_opmode_oneshot);     %AD
    % [~,xyz] = vrep.simxGetObjectOrientation(clientID, object_handle, relative_handle, vrep.simx_opmode_blocking);     % AD
    % [~,quat] = vrep.simxGetObjectQuaternion(clientID, object_handle, relative_handle, vrep.simx_opmode_blocking);
    
    % xyz转欧拉角
    %xyz = double(xyz);     % AD
    %r = SO3.Rx(xyz(1)) * SO3.Ry(xyz(2)) * SO3.Rz(xyz(3));     % AD
    %eul = r.toeul();     % AD
    
    % 输出
    %sys = [double(position),eul];     % AD
	sys = [];
end

%function sys = mdlOutputs(t,x,u,vrep,clientID,object_name,relative_object_name)    %AD
    % 获取物体的句柄
%    [~, object_handle] = vrep.simxGetObjectHandle(clientID, object_name, vrep.simx_opmode_blocking);
    
    % 获取参考系的句柄
%    if strcmp(relative_object_name, 'world')        % 相对于世界坐标系
%        relative_handle = -1;
%    elseif strcmp(relative_object_name, 'parent')   % 相对于父坐标系
%        relative_handle = vrep.sim_handle_parent;
%    else
%        [~, relative_handle] = vrep.simxGetObjectHandle(clientID, relative_object_name, vrep.simx_opmode_blocking);
%    end
    
    % 获取相对位置
%    [~, position] = vrep.simxSetObjectPosition(clientID, object_handle, relative_handle, vrep.simx_opmode_blocking);
    % [~,xyz] = vrep.simxGetObjectOrientation(clientID, object_handle, relative_handle, vrep.simx_opmode_blocking);     % AD
    % [~,quat] = vrep.simxGetObjectQuaternion(clientID, object_handle, relative_handle, vrep.simx_opmode_blocking);
    
    % xyz转欧拉角
    %xyz = double(xyz);     % AD
    %r = SO3.Rx(xyz(1)) * SO3.Ry(xyz(2)) * SO3.Rz(xyz(3));     % AD
    %eul = r.toeul();     % AD
    
    % 输出
    %sys = [double(position),eul];     % AD
%	sys = double(position);
%end

function sys = mdlOutputs(t,x,u)
    sys = [];
end