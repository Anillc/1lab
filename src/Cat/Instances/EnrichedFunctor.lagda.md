<!--
```agda
open import Cat.Monoidal.Base
open import Cat.Prelude

open import Cat.Enriched.Base

import Cat.Enriched.Reasoning
```
-->

```agda
module Cat.Instances.EnrichedFunctor
  {ov ℓv} {V : Precategory ov ℓv}
  {V-monoidal : Monoidal-category V}
  where
```

# Enriched functor precategories

Let $\cV$ be a [[monoidal category]], and fix a pair of
$\cV$-[[enriched categories]] $\cC$ and $\cD$. The collection of
$\cV$-[[enriched functors]] can be formed into a category whose morphisms
are $\cV$-[[enriched natural transformations]].

<!--
```agda
open Monoidal-category V-monoidal
open Enriched-functor
open _=>v_

private
  module V = Precategory V

  variable
    ob oc od oe : Level
    B C D E : Enriched-precategory V-monoidal ob
    F G H : Enriched-functor C D
```
-->

First, we need to prove some basic facts about enriched natural
transformations. Let $F : \cC \to \cD$ be a $\cV$-enriched functor.
We can construct the identity enriched natural transformation $F \to F$
by taking every component to be the identity morphism in $\cC$.

```agda
idntv : ∀ {F : Enriched-functor C D} → F =>v F
idntv {D = D} {F = F} = nat
  module idntv where
  module D = Cat.Enriched.Reasoning D

  nat : F =>v F
  nat .ηv Γ x = D.idv
  nat .is-naturalv f = D.id-comm-symv
  nat .ηv-natural σ = D.idv-natural σ
```

Likewise, enriched natural transformations can be composed vertically.

```agda
_∘ntv_ : ∀ {F G H : Enriched-functor C D} → G =>v H → F =>v G → F =>v H
_∘ntv_ {D = D} {F} {G} {H} α β = nat
  module ∘ntv where
  module D = Cat.Enriched.Reasoning D

  nat : F =>v H
  nat .ηv Γ x = α .ηv Γ x D.∘v β .ηv Γ x
  nat .is-naturalv f =
    D.pullrv (β .is-naturalv f) ∙ D.extendlv (α .is-naturalv f)
  nat .ηv-natural σ =
    (α .ηv _ _ D.∘v β .ηv _ _) V.∘ σ       ≡⟨ D.∘v-naturalr (α .ηv _ _) (β .ηv _ _) σ ⟩
    α .ηv _ _ D.∘v (β .ηv _ _ V.∘ σ)       ≡⟨ ap₂ D._∘v_ refl (β .ηv-natural σ) ⟩
    α .ηv _ _ D.∘v ((σ ◀ _) V.∘ β .ηv _ _) ≡⟨ D.∘v-natural-inner (α .ηv _ _) σ (β .ηv _ _) ⟩
    (α .ηv _ _ V.∘ σ) D.∘v β .ηv _ _       ≡⟨ ap₂ D._∘v_ (α .ηv-natural σ) refl ⟩
    ((σ ◀ _) V.∘ α .ηv _ _) D.∘v β .ηv _ _ ≡˘⟨ D.∘v-naturall σ (α .ηv _ _) (β .ηv _ _) ⟩
    (σ ◀ _) V.∘ (α .ηv _ _ D.∘v β .ηv _ _) ∎
```

<!--
```agda
{-# DISPLAY idntv.nat = idntv #-}
{-# DISPLAY ∘ntv.nat = _∘ntv_ #-}
```
-->

This gives us enough structure to form the category of $[\cC,\cD]$ of
$\cV$-enriched functors.

```agda
module _
  {oc od}
  (C : Enriched-precategory V-monoidal oc)
  (D : Enriched-precategory V-monoidal od)
  where
  open Precategory

  private
    module C = Enriched-precategory C
    module D = Enriched-precategory D

  VCat[_,_] : Precategory (ov ⊔ ℓv ⊔ oc ⊔ od) (ov ⊔ ℓv ⊔ oc ⊔ od)
  VCat[_,_] .Ob = Enriched-functor C D
  VCat[_,_] .Hom = _=>v_
  VCat[_,_] .Hom-set _ _ = Enriched-nat-is-set
  VCat[_,_] .id = idntv
  VCat[_,_] ._∘_ = _∘ntv_
  VCat[_,_] .idr α =
    Enriched-nat-path λ Γ x → D.idrv (α .ηv Γ x)
  VCat[_,_] .idl α =
    Enriched-nat-path λ Γ x → D.idlv (α .ηv Γ x)
  VCat[_,_] .assoc α β γ =
    Enriched-nat-path λ Γ x → D.assocv (α .ηv Γ x) (β .ηv Γ x) (γ .ηv Γ x)
```
