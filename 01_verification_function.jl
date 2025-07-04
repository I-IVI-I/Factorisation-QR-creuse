using LinearAlgebra

function QR_verification(A, Q, R; ortho_tol=1e-12, reconstruction_tol=1e-12)
  m, n = size(A)
  if size(Q) ≠ (m,n) || size(R) ≠ (n,n)
    error("Dimention mismatch between A, Q, and R")
  end

  ortho_error = norm(Q' * Q - I, Inf)
  is_orthogonal = ortho_error < ortho_tol
  println("Orthogonality check: Q'Q - I = ", ortho_error, " (", is_orthogonal ? "PASS" : "FAIL", ")")

  reconstruction_error = norm(Q * R - A, Inf)
  is_correct = reconstruction_error < reconstruction_tol
  println("Reconstruction check : QR - A =", reconstruction_error, "(", is_correct ? "PASS" : "FAIL",")")

end



