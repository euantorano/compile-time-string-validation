const std = @import("std");
const tokenize = std.mem.tokenize;
const stringToEnum = std.meta.stringToEnum;
const warn = std.debug.warn;
const build_options = @import("build_options");

const Promises = enum {
    stdio,
    rpath,
    wpath,
    path,
    dpath,
};

fn validatePromises(promises: []const u8) bool {
    var splitter = tokenize(promises, " ");

    while (splitter.next()) |s| {
        _ = stringToEnum(Promises, s) orelse return false;
    }

    return true;
}

fn promise(comptime promises: []const u8) void {
    comptime {
        if (!validatePromises(promises)) {
            @compileError("invalid promises: " ++ promises);
        }
    }

    warn("valid promises: {}", .{promises});
}

pub fn main() anyerror!void {
    if (build_options.invalidPromises) {
        promise("stdio foobar");
    } else {
        promise("stdio rpath wpath");
    }
}
