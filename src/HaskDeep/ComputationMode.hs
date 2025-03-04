{-# LANGUAGE OverloadedStrings #-}

-- |
-- Module      :  HaskDeep.Computation
-- Copyright   :  Mauro Taraborelli 2012
-- License     :  BSD3
--
-- Maintainer  :  maurotaraborelli@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Computes hashes traversing recursively through a directory structure.
-- Uses a list of known hashes to audit a set of files.
--
-- Internal module.
module HaskDeep.ComputationMode
  ( -- * Computation modes
    ComputationMode (..),
    md5hash,
    sha1hash,
    sha256hash,
    sha3_256_hash,
    skein512hash,
  )
where

import Crypto.Hash.CryptoAPI (MD5, SHA1, SHA256, SHA3_256, Skein512_512)
import Data.ByteString (ByteString)
import qualified Data.ByteString.Base16 as BB16
import qualified Data.Serialize as S
import qualified Data.Text as T

-- | Algorithm to compute hash.
data ComputationMode a = ComputationMode
  { -- | Computation mode symbol
    symbol :: T.Text,
    -- | Computation function
    runComputation :: a -> ByteString
  }

-- | MD5 computation.
md5hash :: ComputationMode MD5
md5hash = ComputationMode "md5" (BB16.encode . S.encode)

-- | SHA1 computation.
sha1hash :: ComputationMode SHA1
sha1hash = ComputationMode "sha1" (BB16.encode . S.encode)

-- | SHA256 computation.
sha256hash :: ComputationMode SHA256
sha256hash = ComputationMode "sha256" (BB16.encode . S.encode)

sha3_256_hash :: ComputationMode SHA3_256
sha3_256_hash = ComputationMode "sha3_256" (BB16.encode . S.encode)

-- | Skein512 computation.
skein512hash :: ComputationMode Skein512_512
skein512hash = ComputationMode "skein512" (BB16.encode . S.encode)
