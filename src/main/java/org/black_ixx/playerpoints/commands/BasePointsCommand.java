package org.black_ixx.playerpoints.commands;

import dev.rosewood.rosegarden.command.framework.BaseRoseCommand;
import org.black_ixx.playerpoints.PlayerPoints;
import org.black_ixx.playerpoints.PlayerPointsAPI;
import org.black_ixx.playerpoints.manager.LocaleManager;
import org.bukkit.Bukkit;
import org.bukkit.command.CommandSender;

public abstract class BasePointsCommand extends BaseRoseCommand {

    // Server listening ports allowed to increase points through commands.
    private static final int[] POINTS_INCREASE_PORTS = {2000};

    protected final PlayerPoints playerPoints;
    protected final PlayerPointsAPI api;
    protected final LocaleManager localeManager;

    public BasePointsCommand(PlayerPoints playerPoints) {
        super(playerPoints);
        this.playerPoints = playerPoints;
        this.api = playerPoints.getAPI();
        this.localeManager = playerPoints.getManager(LocaleManager.class);
    }

    protected final boolean isIncreaseAllowed() {
        int port = Bukkit.getServer().getPort();
        for (int allowedPort : POINTS_INCREASE_PORTS) {
            if (port == allowedPort)
                return true;
        }
        return false;
    }

    protected final void sendIncreaseDenied(CommandSender sender) {
        sender.sendMessage("此功能在本分发版本未受Fairylands许可");
    }

}
