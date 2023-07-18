defmodule Stats.CentralTendency.Mean do
  alias Stats.Errors
  alias Stats.Validators
  #sum (sigma) / count
  #=====================================================================

    @spec population_mean([number()]) :: number() | {atom(), String.t()}
  def population_mean([]), do: Errors.invalid_data_type()

  def population_mean(nums) when is_list(nums) do
    nums
    |> Validators.validate_num_list()
    |> calc_population_mean()
  end

  #======================================================================
    @spec sample_mean([number()]) :: number() | {atom(), String.t()}
  def sample_mean(_), do: Errors.invalid_data_type()
  #====================================================================

  defp calc_population_mean({false, _}), do: Errors.invalid_data_type()

  defp calc_population_mean({true, nums}) do
    nums
    |> Enum.sum()
    |> mean(Enum.count(nums))
  end

  #======================================================================
  defp mean(sigma, count), do: sigma / count
end
