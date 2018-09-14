# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spid::Saml2::IdentityProvider do
  subject(:idp_configuration) do
    described_class.new identity_provider_attributes
  end

  let(:identity_provider_attributes) do
    {
      entity_id: entity_id,
      sso_target_url: sso_target_url,
      slo_target_url: slo_target_url,
      certificate: certificate
    }
  end

  let(:entity_id) { "https://example.com" }
  let(:sso_target_url) { "#{entity_id}/sso-path" }
  let(:slo_target_url) { "#{entity_id}/slo-path" }
  let(:certificate) { File.read(generate_fixture_path("certificate.pem")) }

  it { is_expected.to be_a described_class }

  it "requires an entity_id" do
    expect(idp_configuration.entity_id).to eq entity_id
  end

  it "requires an sso_target_url" do
    expect(idp_configuration.sso_target_url).to eq sso_target_url
  end

  it "requires an slo_target_url" do
    expect(idp_configuration.slo_target_url).to eq slo_target_url
  end

  it "requires a certificate" do
    expect(idp_configuration.certificate).to eq certificate
  end
end
