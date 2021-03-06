open nat well_founded

def gcd' : ℕ → ℕ → ℕ | y := λ x,
if h : y = 0 then
    x
else
    have x % y < y, by { apply mod_lt, cases y, contradiction, apply succ_pos },
    gcd' (x % y) y

lemma gcd_zero_right (x : nat) : gcd' 0 x = x :=
begin
  rw [gcd'],
  simp
end

lemma ex (x : nat) (h : gcd' 0 x = 0) : x + x = 0 :=
begin
  rw [gcd'] at h,
  simp at h,
  simp [h]
end
