class ManageIQ::Providers::Openshift::Inventory::Persister::TargetCollection < ManageIQ::Providers::Openshift::Inventory::Persister::ContainerManager
  def targeted
    false # TODO(lsmola) get ready for true, which means a proper targeted refresh. That will require more effort.
  end

  def shared_options
    settings_options = options[:inventory_collections].try(:to_hash) || {}

    settings_options.merge(
      :targeted => targeted,
      :complete => false, # For now, we want to a only create and update elements using watches data, delete events could
      # probably set finished_at and deleted on dates, as an update based disconnect_inv.
      :strategy => :local_db_find_references, # By default no IC will be saved
    )
  end
end
