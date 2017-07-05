with SDL;
with Switches;
with Sensors;

package Constants is
    Map_Area : constant SDL.Rectangle := (
        Top => 0.0,
        Left => 0.0,
        Width => 0.8,
        Height => 1.0);
    BiSwitch_Area : constant array (Switches.BiSwitch) of SDL.Rectangle := (
        1 => (Top => 0.795, Left => 0.086, Width => 0.071, Height => 0.097),
        2 => (Top => 0.863, Left => 0.152, Width => 0.070, Height => 0.097),
        3 => (Top => 0.932, Left => 0.217, Width => 0.071, Height => 0.064),
        4 => (Top => 0.038, Left => 0.078, Width => 0.072, Height => 0.097),
        5 => (Top => 0.930, Left => 0.484, Width => 0.072, Height => 0.066),
        6 => (Top => 0.896, Left => 0.288, Width => 0.072, Height => 0.063),
        7 => (Top => 0.894, Left => 0.550, Width => 0.071, Height => 0.064),
        8 => (Top => 0.532, Left => 0.770, Width => 0.030, Height => 0.230),
        9 => (Top => 0.167, Left => 0.770, Width => 0.030, Height => 0.230),
        10 => (Top => 0.069, Left => 0.549, Width => 0.072, Height => 0.064),
        11 => (Top => 0.003, Left => 0.215, Width => 0.072, Height => 0.064),
        12 => (Top => 0.002, Left => 0.144, Width => 0.071, Height => 0.063),
        13 => (Top => 0.067, Left => 0.288, Width => 0.072, Height => 0.067),
        14 => (Top => 0.056, Left => 0.133, Width => 0.074, Height => 0.194),
        15 => (Top => 0.680, Left => 0.133, Width => 0.074, Height => 0.194),
        16 => (Top => 0.797, Left => 0.288, Width => 0.071, Height => 0.066),
        17 => (Top => 0.797, Left => 0.550, Width => 0.071, Height => 0.066),
        18 => (Top => 0.930, Left => 0.354, Width => 0.071, Height => 0.066));
    TriSwitch_Area : constant array (Switches.TriSwitch) of SDL.Rectangle := (
        Switches.NORTH_SWITCH =>
            (Top =>  0.304, Left =>  0.434, Width =>  0.042, Height =>  0.162),
        Switches.SOUTH_SWITCH =>
            (Top =>  0.467, Left =>  0.434, Width =>  0.042, Height =>  0.162));

    Sensor_Area : constant array (Sensors.SensorGroup, Sensors.SensorId) of
        SDL.Rectangle := (
        Sensors.SG_A => (
         1 => (Top => 0.000, Left => 0.112, Width => 0.027, Height => 0.042),
         2 => (Top => 0.000, Left => 0.112, Width => 0.027, Height => 0.042),
         3 => (Top => 0.247, Left => 0.123, Width => 0.021, Height => 0.063),
         4 => (Top => 0.247, Left => 0.120, Width => 0.021, Height => 0.063),
         5 => (Top => 0.951, Left => 0.188, Width => 0.027, Height => 0.051),
         6 => (Top => 0.955, Left => 0.188, Width => 0.027, Height => 0.046),
         7 => (Top => 0.888, Left => 0.123, Width => 0.027, Height => 0.042),
         8 => (Top => 0.888, Left => 0.124, Width => 0.027, Height => 0.042),
         9 => (Top => 0.822, Left => 0.055, Width => 0.027, Height => 0.042),
         10 => (Top => 0.822, Left => 0.055, Width => 0.027, Height => 0.042),
         11 => (Top => 0.757, Left => 0.008, Width => 0.027, Height => 0.042),
         12 => (Top => 0.757, Left => 0.008, Width => 0.027, Height => 0.042),
         13 => (Top => 0.064, Left => 0.047, Width => 0.027, Height => 0.044),
         14 => (Top => 0.064, Left => 0.047, Width => 0.027, Height => 0.044),
         15 => (Top => 0.132, Left => 0.002, Width => 0.027, Height => 0.044),
         16 => (Top => 0.132, Left => 0.002, Width => 0.027, Height => 0.044)
        ),
        Sensors.SG_B => (
         1 => (Top => 0.822, Left => 0.364, Width => 0.027, Height => 0.046),
         2 => (Top => 0.822, Left => 0.364, Width => 0.027, Height => 0.046),
         3 => (Top => 0.763, Left => 0.361, Width => 0.027, Height => 0.046),
         4 => (Top => 0.769, Left => 0.361, Width => 0.027, Height => 0.046),
         5 => (Top => 0.063, Left => 0.364, Width => 0.027, Height => 0.046),
         6 => (Top => 0.063, Left => 0.364, Width => 0.027, Height => 0.046),
         7 => (Top => 0.819, Left => 0.019, Width => 0.027, Height => 0.046),
         8 => (Top => 0.819, Left => 0.019, Width => 0.027, Height => 0.046),
         9 => (Top => 0.954, Left => 0.018, Width => 0.027, Height => 0.046),
         10 => (Top => 0.955, Left => 0.018, Width => 0.027, Height => 0.046),
         11 => (Top => 0.887, Left => 0.019, Width => 0.027, Height => 0.046),
         12 => (Top => 0.887, Left => 0.019, Width => 0.027, Height => 0.046),
         13 => (Top => 0.637, Left => 0.468, Width => 0.021, Height => 0.055),
         14 => (Top => 0.637, Left => 0.470, Width => 0.021, Height => 0.055),
         15 => (Top => 0.623, Left => 0.119, Width => 0.021, Height => 0.057),
         16 => (Top => 0.625, Left => 0.122, Width => 0.021, Height => 0.057)
        ),
        Sensors.SG_C => (
         1 => (Top => 0.635, Left => 0.418, Width => 0.021, Height => 0.057),
         2 => (Top => 0.634, Left => 0.421, Width => 0.021, Height => 0.057),
         3 => (Top => 0.954, Left => 0.561, Width => 0.027, Height => 0.047),
         4 => (Top => 0.954, Left => 0.561, Width => 0.027, Height => 0.047),
         5 => (Top => 0.886, Left => 0.252, Width => 0.027, Height => 0.047),
         6 => (Top => 0.882, Left => 0.252, Width => 0.027, Height => 0.047),
         7 => (Top => 0.954, Left => 0.321, Width => 0.027, Height => 0.047),
         8 => (Top => 0.954, Left => 0.321, Width => 0.027, Height => 0.047),
         9 => (Top => 0.822, Left => 0.260, Width => 0.027, Height => 0.047),
         10 => (Top => 0.822, Left => 0.260, Width => 0.027, Height => 0.047),
         11 => (Top => 0.061, Left => 0.260, Width => 0.027, Height => 0.047),
         12 => (Top => 0.061, Left => 0.260, Width => 0.027, Height => 0.047),
         13 => (Top => 0.001, Left => 0.292, Width => 0.027, Height => 0.041),
         14 => (Top => 0.001, Left => 0.292, Width => 0.027, Height => 0.041),
         15 => (Top => 0.890, Left => 0.364, Width => 0.027, Height => 0.045),
         16 => (Top => 0.890, Left => 0.364, Width => 0.027, Height => 0.045)
        ),
        Sensors.SG_D => (
         1 => (Top => 0.240, Left => 0.467, Width => 0.021, Height => 0.059),
         2 => (Top => 0.239, Left => 0.470, Width => 0.021, Height => 0.059),
         3 => (Top => 0.065, Left => 0.519, Width => 0.027, Height => 0.043),
         4 => (Top => 0.065, Left => 0.519, Width => 0.027, Height => 0.043),
         5 => (Top => 0.184, Left => 0.754, Width => 0.023, Height => 0.054),
         6 => (Top => 0.184, Left => 0.754, Width => 0.023, Height => 0.054),
         7 => (Top => 0.116, Left => 0.754, Width => 0.023, Height => 0.054),
         8 => (Top => 0.116, Left => 0.754, Width => 0.023, Height => 0.054),
         9 => (Top => 0.759, Left => 0.754, Width => 0.023, Height => 0.054),
         10 => (Top => 0.759, Left => 0.754, Width => 0.023, Height => 0.054),
         11 => (Top => 0.887, Left => 0.518, Width => 0.028, Height => 0.049),
         12 => (Top => 0.887, Left => 0.518, Width => 0.028, Height => 0.049),
         13 => (Top => 0.821, Left => 0.518, Width => 0.028, Height => 0.049),
         14 => (Top => 0.821, Left => 0.518, Width => 0.028, Height => 0.049),
         15 => (Top => 0.761, Left => 0.520, Width => 0.028, Height => 0.049),
         16 => (Top => 0.767, Left => 0.519, Width => 0.028, Height => 0.049)
        ),
        Sensors.SG_E => (
         1 => (Top => 0.240, Left => 0.420, Width => 0.023, Height => 0.060),
         2 => (Top => 0.240, Left => 0.420, Width => 0.023, Height => 0.060),
         3 => (Top => 0.124, Left => 0.521, Width => 0.026, Height => 0.047),
         4 => (Top => 0.118, Left => 0.520, Width => 0.026, Height => 0.047),
         5 => (Top => 0.063, Left => 0.626, Width => 0.026, Height => 0.047),
         6 => (Top => 0.063, Left => 0.626, Width => 0.026, Height => 0.047),
         7 => (Top => 0.000, Left => 0.626, Width => 0.026, Height => 0.047),
         8 => (Top => 0.000, Left => 0.626, Width => 0.026, Height => 0.047),
         9 => (Top => 0.691, Left => 0.755, Width => 0.022, Height => 0.059),
         10 => (Top => 0.692, Left => 0.754, Width => 0.022, Height => 0.059),
         11 => (Top => 0.887, Left => 0.625, Width => 0.027, Height => 0.048),
         12 => (Top => 0.887, Left => 0.625, Width => 0.027, Height => 0.048),
         13 => (Top => 0.822, Left => 0.625, Width => 0.027, Height => 0.048),
         14 => (Top => 0.822, Left => 0.625, Width => 0.027, Height => 0.048),
         15 => (Top => 0.116, Left => 0.361, Width => 0.027, Height => 0.048),
         16 => (Top => 0.122, Left => 0.361, Width => 0.027, Height => 0.048)
        ));

end Constants;
