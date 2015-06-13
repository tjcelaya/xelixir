if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("point_mutations.exs")
end

ExUnit.start

defmodule PointMutationsTest do
  use ExUnit.Case, async: true

  test "no difference between empty strands" do
    assert DNAAnalyzer.hamming_distance('', '') == 0
  end

  test "no difference between identical strands" do
    assert DNAAnalyzer.hamming_distance('GGACTGA', 'GGACTGA') == 0
  end

  test "small hamming distance in middle somewhere" do
    assert DNAAnalyzer.hamming_distance('GGACG', 'GGTCG') == 1
  end

  test "larger distance" do
    assert DNAAnalyzer.hamming_distance('ACCAGGG', 'ACTATGG') == 2
  end

  test "hamming distance is undefined for strands of different lengths" do
    assert DNAAnalyzer.hamming_distance('AAAC', 'TAGGGGAGGCTAGCGGTAGGAC') == nil
    assert DNAAnalyzer.hamming_distance('GACTACGGACAGGACACC', 'GACATCGC') == nil
  end
end
