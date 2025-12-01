const std = @import("std");

pub fn info(comptime msg: []const u8, data: anytype) void {
    if (@import("options").debug) std.debug.print("info: " ++ msg ++ "\n", data);
}
