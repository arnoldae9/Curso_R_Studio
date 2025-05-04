# Haciendo source para usar funcion en mi script
source("~/Documentos/GitHub/Curso_R_Studio/FuncionPrueba.R")

# Correr la funcion de prueba 
FuncionPrueba("a")

install.packages("testthat")
library(testthat)

test_that("Testeando de que el tamano es correcto",{
  expect_equal(nchar("a"),1)
  expect_equal(nchar("ab"),2)
  expect_equal(nchar("abc"),3)
})
