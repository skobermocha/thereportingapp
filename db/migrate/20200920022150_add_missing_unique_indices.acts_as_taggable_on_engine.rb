# This migration comes from acts_as_taggable_on_engine (originally 2)
if ActiveRecord.gem_version >= Gem::Version.new('5.0')
  class AddMissingUniqueIndices < ActiveRecord::Migration[4.2]; end
else
  class AddMissingUniqueIndices < ActiveRecord::Migration; end
end
AddMissingUniqueIndices.class_eval do
    
  def self.up
    remove_index ActsAsTaggableOn.tags_table, :name
    safety_assured {add_index ActsAsTaggableOn.tags_table, :name, unique: true}

    remove_index ActsAsTaggableOn.taggings_table, :tag_id if index_exists?(ActsAsTaggableOn.taggings_table, :tag_id)
    remove_index ActsAsTaggableOn.taggings_table, name: 'taggings_taggable_context_idx' if index_exists?(ActsAsTaggableOn.taggings_table, name: 'taggings_taggable_context_idx')
    safety_assured {add_index ActsAsTaggableOn.taggings_table,
              [:tag_id, :taggable_id, :taggable_type, :context, :tagger_id, :tagger_type],
              unique: true, name: 'taggings_idx'}
  end

  def self.down
    remove_index ActsAsTaggableOn.tags_table, :name

    remove_index ActsAsTaggableOn.taggings_table, name: 'taggings_idx'

    safety_assured {add_index ActsAsTaggableOn.taggings_table, :tag_id unless index_exists?(ActsAsTaggableOn.taggings_table, :tag_id)}
    safety_assured {add_index ActsAsTaggableOn.taggings_table, [:taggable_id, :taggable_type, :context], name: 'taggings_taggable_context_idx'}
  end
end
