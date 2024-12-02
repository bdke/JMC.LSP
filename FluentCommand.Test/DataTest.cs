﻿using FluentCommand.Helpers;

namespace FluentCommand.Test;
public class DataTest
{
    [Fact]
    public void GetData_Test()
    {
        MineSharp.Core.Common.Blocks.BlockInfo[] blocks = MinecraftDataService.Transient.GetAllBlocks().ToArray();

        _ = blocks.Should().NotBeEmpty();
    }
}
