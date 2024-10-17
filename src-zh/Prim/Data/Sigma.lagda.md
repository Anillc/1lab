<!--
```agda
open import Prim.Extension
open import Prim.Interval
open import Prim.Type
open import Prim.Kan
```
-->

```agda
module Prim.Data.Sigma where
```

# 原始类型：Σ 类型

The dependent sum type, total space, or type of dependent pairs, is
defined as a record, so that it enjoys definitional η.

```agda
record Σ {ℓ ℓ'} (A : Type ℓ) (B : A → Type ℓ') : Type (ℓ ⊔ ℓ') where
  constructor _,_
  field
    fst : A
    snd : B fst

open Σ public

{-# BUILTIN SIGMA Σ #-}

infixr 4 _,_
```

<!--
```agda
Σ-syntax : ∀ {ℓ ℓ'} (A : Type ℓ) (F : A → Type ℓ') → Type _
Σ-syntax X F = Σ X F

syntax Σ-syntax X (λ x → F) = Σ[ x ∈ X ] F
infix 4 Σ-syntax

instance
  Σ-of-instances : ∀ {ℓ ℓ'} {A : Type ℓ} {B : A → Type ℓ'} ⦃ x : A ⦄ ⦃ y : B x ⦄ → Σ A B
  Σ-of-instances ⦃ x ⦄ ⦃ y ⦄ = x , y
```
-->

类似地，对于单位类型：

```agda
record ⊤ : Type where
  instance constructor tt
{-# BUILTIN UNIT ⊤ #-}
```
