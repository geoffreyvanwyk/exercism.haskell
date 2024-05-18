{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_temperature (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/scholar/exercism/haskell/temperature/.stack-work/install/x86_64-linux-tinfo6/4bc9bbe26dc3bb19c7e6c230c2a8f162a507b43c2f2df8c60b9ee3b90655f13f/8.10.7/bin"
libdir     = "/home/scholar/exercism/haskell/temperature/.stack-work/install/x86_64-linux-tinfo6/4bc9bbe26dc3bb19c7e6c230c2a8f162a507b43c2f2df8c60b9ee3b90655f13f/8.10.7/lib/x86_64-linux-ghc-8.10.7/temperature-1.0.0.0-9etzWuQbeGmQoOH3VDfVz"
dynlibdir  = "/home/scholar/exercism/haskell/temperature/.stack-work/install/x86_64-linux-tinfo6/4bc9bbe26dc3bb19c7e6c230c2a8f162a507b43c2f2df8c60b9ee3b90655f13f/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/home/scholar/exercism/haskell/temperature/.stack-work/install/x86_64-linux-tinfo6/4bc9bbe26dc3bb19c7e6c230c2a8f162a507b43c2f2df8c60b9ee3b90655f13f/8.10.7/share/x86_64-linux-ghc-8.10.7/temperature-1.0.0.0"
libexecdir = "/home/scholar/exercism/haskell/temperature/.stack-work/install/x86_64-linux-tinfo6/4bc9bbe26dc3bb19c7e6c230c2a8f162a507b43c2f2df8c60b9ee3b90655f13f/8.10.7/libexec/x86_64-linux-ghc-8.10.7/temperature-1.0.0.0"
sysconfdir = "/home/scholar/exercism/haskell/temperature/.stack-work/install/x86_64-linux-tinfo6/4bc9bbe26dc3bb19c7e6c230c2a8f162a507b43c2f2df8c60b9ee3b90655f13f/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "temperature_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "temperature_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "temperature_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "temperature_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "temperature_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "temperature_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
