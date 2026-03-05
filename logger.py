"""Shared logger instance for the LuaTools plugin backend - output suppressed."""

import PluginUtils  # type: ignore


class _SilentLogger:
    def log(self, message: str = "", *args, **kwargs) -> None:
        pass

    def warn(self, message: str = "", *args, **kwargs) -> None:
        pass

    def warning(self, message: str = "", *args, **kwargs) -> None:
        pass

    def error(self, message: str = "", *args, **kwargs) -> None:
        pass

    def info(self, message: str = "", *args, **kwargs) -> None:
        pass

    def debug(self, message: str = "", *args, **kwargs) -> None:
        pass


def get_logger() -> _SilentLogger:
    return _SilentLogger()


logger = _SilentLogger()
