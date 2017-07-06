#!/usr/bin/env zunit

@test 'Test _zunit_assert_is_substring_of match' {
  run assert 'lo wo' is_substring_of 'hello world'

  assert "$output" is_empty
  assert $state equals 0
}

@test 'Test _zunit_assert_is_substring_of suffix match' {
  run assert 'world' is_substring_of 'hello world'

  assert "$output" is_empty
  assert $state equals 0
}

@test 'Test _zunit_assert_is_substring_of prefix match' {
  run assert 'hello' is_substring_of 'hello world'

  assert "$output" is_empty
  assert $state equals 0
}

@test 'Test _zunit_assert_is_substring_of whole word matches' {
  run assert 'red blue green' is_substring_of 'red blue green'

  assert "$output" is_empty
  assert $state equals 0
}

@test 'Test _zunit_assert_is_substring_of match failure' {
  run assert 'foo' is_substring_of 'elephants'

  assert "$output" same_as "'foo' is not a substring of 'elephants'"
  assert $state equals 1
}
