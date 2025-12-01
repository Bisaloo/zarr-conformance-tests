#!/usr/bin/env bats

set -eu

# bats file_tags=v2

# bats test_tags=int64
@test "read int64 - v2" {
  run $ZARR_CLI --array_path=$ZARR_CONFORMANCE_DATA/int64.zarr
  [ "$status" -eq 0 ]
}

# bats test_tags=int32
@test "read int32 - v2" {
  run $ZARR_CLI --array_path=$ZARR_CONFORMANCE_DATA/int32.zarr
  [ "$status" -eq 0 ]
}

# bats test_tags=float64
@test "read float64 - v2" {
  run $ZARR_CLI --array_path=$ZARR_CONFORMANCE_DATA/float64.zarr
  [ "$status" -eq 0 ]
}

# bats test_tags=float32
@test "read float32 - v2" {
  run $ZARR_CLI --array_path=$ZARR_CONFORMANCE_DATA/float32.zarr
  [ "$status" -eq 0 ]
}

# bats test_tags=bool
@test "read bool - v2" {
  run $ZARR_CLI --array_path=$ZARR_CONFORMANCE_DATA/bool.zarr
  [ "$status" -eq 0 ]
}

# bats file_tags=v3

# bats test_tags=int32
@test "read int32 - v3" {
  run $ZARR_CLI --array_path=$ZARR_CONFORMANCE_DATA/int32_v3.zarr
  [ "$status" -eq 0 ]
}
