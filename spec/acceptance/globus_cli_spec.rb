require 'spec_helper_acceptance'

describe 'globus::cli class:', if: fact('os.release.major').to_i >= 7 do
  context 'with default parameters' do
    it 'runs successfully' do
      pp = 'include globus::cli'

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end
end
