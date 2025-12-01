const std = @import("std");

const days = .{
    @import("days/day1.zig"),
    @import("days/day2.zig"),
};

pub fn main() !void {
    inline for (days) |day| {
        day.challenge1() catch |err|
            std.debug.print(day.NAME ++ "c1 failed: {!}\n", .{err});
        day.challenge2() catch |err|
            std.debug.print(day.NAME ++ "c2 failed: {!}\n", .{err});
    }
}
