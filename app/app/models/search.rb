class Search < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :prices, through: :items

  scope :not_deleted, -> { where(deleted_at: nil) }
  scope :deleted, -> { where("#{table_name}.deleted_at IS NOT NULL") }
  scope :with_items_info, (
    lambda do
      select('searches.id,
              searches.query,
              searches.min_price,
              searches.max_price,
              COUNT(items.*) as items_count,
              (SELECT COUNT(items.id) FROM items
                WHERE searches.id = search_id
                  AND created_at > ?
                  AND created_at < ? ) AS day_count',
                  Time.zone.now.beginning_of_day,
                  Time.zone.now.end_of_day)
        .joins(:items)
        .group('searches.id')
    end
  )

  def destroy
    update_attributes(deleted_at: DateTime.current)
  end

  def delete
    destroy
  end

  def deleted?
    deleted_at.present?
  end
end

#         .where(items: {created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day})

# @referrals = Referral.select('id, company_id, (SELECT name FROM companies WHERE  id = referred_to_id) AS name')
# .where(company_id: 21)
