<!--
```agda
open import Prim.Extension
open import Prim.Interval
open import Prim.Type
open import Prim.Kan
```
-->

```agda
module Prim.Data.Bool where
```

# 原始类型：布尔类型

The [booleans](Data.Bool.html) are the h-initial type with two inhabitants.

```agda
data Bool : Type where
  true false : Bool
{-# BUILTIN BOOL Bool #-}

{-# BUILTIN FALSE false #-}
{-# BUILTIN TRUE true #-}
```
