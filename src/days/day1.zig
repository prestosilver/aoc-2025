const std = @import("std");
const info = @import("common.zig").info;

pub const NAME = "day1";

pub fn challenge1() !void {
    const file = try std.fs.cwd().openFile("data/day1.txt", .{});
    defer file.close();
    const reader = file.reader();

    var buff: [5]u8 = undefined;

    var idx: i32 = 50;
    var password: usize = 0;
    info("The dial starts by pointing at {}.", .{idx});
    while (try reader.readUntilDelimiterOrEof(&buff, '\n')) |line| {
        const dist = try std.fmt.parseInt(usize, line[1..], 0);

        const inc: i32 = if (line[0] == 'R')
            @intCast(dist)
        else if (line[0] == 'L')
            -@as(i32, @intCast(dist))
        else
            unreachable;

        idx += inc;

        idx = @mod(idx, 100);
        if (idx == 0)
            password += 1;

        info("The dial is rotated {s} to point at {}.", .{ line, idx });
    }

    std.debug.print("The day1c1 password is {}.\n", .{password});
}

pub fn challenge2() !void {
    const file = try std.fs.cwd().openFile("data/day1.txt", .{});
    defer file.close();
    const reader = file.reader();

    var buff: [5]u8 = undefined;

    var idx: i32 = 50;
    var password: usize = 0;
    info("The dial starts by pointing at {}.", .{idx});
    while (try reader.readUntilDelimiterOrEof(&buff, '\n')) |line| {
        const dist = try std.fmt.parseInt(usize, line[1..], 0);

        const inc: i32 = if (line[0] == 'R')
            1
        else if (line[0] == 'L')
            -1
        else
            unreachable;

        var change: usize = 0;

        for (0..dist) |_| {
            idx += inc;

            idx = @mod(idx, 100);
            if (idx == 0)
                change += 1;
        }

        password += change;

        if (change != 0)
            info("The dial is rotated {s} to point at {}; it passed zero {} times.", .{ line, idx, change })
        else
            info("The dial is rotated {s} to point at {}.", .{ line, idx });
    }

    std.debug.print("The day1c2 password is {}.\n", .{password});
}
