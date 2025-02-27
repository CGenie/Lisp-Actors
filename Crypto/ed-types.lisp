
(in-package :edec)

;; equiv to #F
(declaim  (OPTIMIZE (SPEED 3) #|(SAFETY 0)|# #+:LISPWORKS (FLOAT 0)))

(defstruct ed-curve
  name c d q h r gen)

(defstruct (fast-ed-curve (:include ed-curve))
  affine-mul
  proj-mul
  proj-add
  to-affine)

;; -----------------------------------------------------------

(defstruct ecc-pt
  x y)

(defstruct ecc-proj-pt
  x y z)

(defstruct ecc-cmpr-pt
  cx)

#|
(defmethod make-load-form ((point ecc-pt) &optional env)
  (make-load-form-saving-slots point :environment env))

(defmethod make-load-form ((point ecc-proj-pt) &optional env)
  (make-load-form-saving-slots point :environment env))
|#

(defmethod vec-repr:int ((pt ecc-pt))
  (vec-repr:int (ed-compress-pt pt)))

(defmethod vec-repr:int ((pt ecc-proj-pt))
  (vec-repr:int (ed-compress-pt pt)))

(defmethod vec-repr:int ((pt ecc-cmpr-pt))
  (vec-repr:int (ecc-cmpr-pt-cx pt)))


(defmethod vec-repr:bev ((pt ecc-cmpr-pt))
  (vec-repr:bev (ecc-cmpr-pt-cx pt)))

(defmethod vec-repr:bev ((pt ecc-pt))
  (vec-repr:bev (ed-compress-pt pt)))

(defmethod vec-repr:bev ((pt ecc-proj-pt))
  (vec-repr:bev (ed-compress-pt pt)))

