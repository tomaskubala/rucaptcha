require "fileutils"

module RuCaptcha
  class << self
    def cache
      return @cache if defined? @cache

      rails_cache = Rails.cache
      lookuped_store = ActiveSupport::Cache.lookup_store(RuCaptcha.config.cache_store)

      @cache = rails_cache.class == lookuped_store.class ? rails_cache : lookuped_store
      @cache
    end
  end
end
