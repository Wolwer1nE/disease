clc;
close all;
clear all;

global total_citizens simulation_length...
    transmission_rate recovery_rate death_rate...
    isolation_rate transmission_radius

total_citizens = 20;
simulation_length = 50;
transmission_rate = 0.7;
recovery_rate = 0.01;
death_rate = 0.01;
isolation_rate = 0.5;
transmission_radius = 100;

f = figure('Visible', 'off', 'Position', [360, 500, 720, 480]);
left_ui_position = 500;
start_button = uicontrol('Style', 'pushbutton',...
    'String', 'Start Simulation',...
    'Position', [left_ui_position, 40, 160, 20],...
    'Callback', {@start_simulation_callback});

uicontrol('Style', 'text', 'String', 'Number of Citizens',...
    'Position', [left_ui_position, 400, 160, 20],...
    'FontSize', 12);

uicontrol('Style', 'edit', 'String', total_citizens,...
'Position', [left_ui_position, 380, 160, 20],'FontSize', 12,...
'Callback', {@change_tc_callback});

uicontrol('Style', 'text', 'String', 'Social Distancing Rate',...
    'Position', [left_ui_position, 340, 160, 20],...
'FontSize', 12);

uicontrol('Style', 'edit', 'String', isolation_rate,...
'Position', [left_ui_position, 320, 160, 20],'FontSize', 12,...
'Callback', {@change_ir_callback});

global result
result = uicontrol('Style', 'text', 'String', {},...
    'Position', [left_ui_position, 100, 160, 80],...
'FontSize', 12, 'HorizontalAlignment', 'Left');

ha = axes('Units', 'pixels', 'Position', [50, 50, 400, 400]);

set(f, 'Name', 'Virus Simulation');
movegui(f, 'center');
set(f, 'Visible', 'on'); 

function start_simulation_callback(~, ~)   
    global total_citizens simulation_length...
    transmission_rate recovery_rate death_rate...
    isolation_rate transmission_radius result
   
    result.String = run_simulation(total_citizens, simulation_length,...
        transmission_rate, recovery_rate, death_rate,...
        isolation_rate, transmission_radius);
end

function change_tc_callback(source, ~)   
    global total_citizens 
    total_citizens =  round(str2double(source.String));
end

function change_ir_callback(source, ~)   
    global isolation_rate 
    isolation_rate =  round(str2double(source.String));
end