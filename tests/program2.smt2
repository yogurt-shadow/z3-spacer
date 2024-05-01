(set-logic HORN)
(set-option :fp.xform.inline_linear false)
(set-option :fp.xform.inline_eager false)
(declare-fun Inv ( Int ) Bool)
(declare-fun Inc ( Int Int ) Bool)


(assert (forall ((z Int)) (Inc z (+ z 1))))
(assert (forall ((x Int)) (=> (<= x 0) (Inv x))))
(assert (forall ((x Int) (y Int)) (=> (and (< x 5) (Inc x y)) (Inv y))))
(assert (forall ((x Int)) (=> (and (Inv x) (>= x 5) (>= x 10)) false)))
(check-sat)
(get-model)
