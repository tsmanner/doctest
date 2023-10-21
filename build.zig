const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "doctest",
        .target = target,
        .optimize = optimize,
    });
    lib.addCSourceFile(.{
        .file = .{ .path = "doctest/parts/doctest.cpp" },
        .flags = &[_][]const u8{ "-std=c++17", "-Wall", "-Werror", "-fPIC" },
    });
    lib.addIncludePath(.{ .path = "." });
    lib.linkSystemLibrary("stdc++");
    b.installArtifact(lib);
}
