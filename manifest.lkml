# project_name: "scl_twin"

constant: PROJECT {
  #value: "dev-cs-1"
  value: "sct-sandbox-demo"
  export: override_optional
}

constant: DIM_DATASET {
  #value: "scl_demo"
  value: "scl_blume_global_demo"
  export: override_optional
}

constant: FACT_DATASET {
  value: "scl_canonical"
  export: override_optional
}

constant: CONNECTION {
  #value: "scl_twin_private"
  value: "looker-private-demo-1"
  export: override_optional
}
