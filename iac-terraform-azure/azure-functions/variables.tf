variable "nazwa_grupy" {
  type = string
  default = "zasoby_grupy"
}

variable "lokacja_grupy" {
  type = string
  default = "polandcentral"
}

variable "nazwa_konta" {
  type = string
  default = "konto14780923740982"
}

variable "poziom_konta" {
  type = string
  default = "Standard"
}

variable "typ_konta" {
  type = string
  default = "LRS"
}

variable "nazwa_service_plan" {
  type = string
  default = "service_plan_1"
}

variable "rozmiar_service_plan" {
  type = string
  default = "S1"
}

variable "nazwa_aplikacji_linux" {
  type = string
  default = "nazwaaplikacjilinux"
}

variable "nazwa_funkcji_aplikacji" {
  type = string
  default = "nazwafunkcjiaplikacji"
}

variable "nazwa_testu" {
  type = string
  default = "Azure"
}

variable "kod_json" {
  type = any
  default = {
    "bindings" = [
      {
        "authLevel" = "function"
        "direction" = "in"
        "methods"   = [
          "get",
          "post",
        ]
        "name" = "req"
        "type" = "httpTrigger"
      },
      {
        "direction" = "out"
        "name"      = "$return"
        "type"      = "http"
      },
    ]
  }
}
