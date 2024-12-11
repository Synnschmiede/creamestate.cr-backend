/*
  Warnings:

  - You are about to drop the `data_management` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "data_management";

-- CreateTable
CREATE TABLE "records" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "campaign" TEXT,
    "product" TEXT,
    "stakeholder" TEXT,
    "posting_quality" TEXT,
    "google_drive_files" TEXT,
    "playbook_link" TEXT,
    "uppromote_conversion" INTEGER NOT NULL DEFAULT 0,
    "asset_status" TEXT,
    "month_uploaded" TIMESTAMP(3),
    "REVO_pinterest" TEXT DEFAULT 'not-posted',
    "PIN_accounts_used" TEXT DEFAULT 'not-posted',
    "pinterest_PIN_click" INTEGER NOT NULL DEFAULT 0,
    "pinterest_view" INTEGER NOT NULL DEFAULT 0,
    "REVO_instagram" TEXT,
    "IG_like" INTEGER NOT NULL DEFAULT 0,
    "IG_comment" INTEGER NOT NULL DEFAULT 0,
    "IG_share" INTEGER NOT NULL DEFAULT 0,
    "IG_view" INTEGER NOT NULL DEFAULT 0,
    "IG_social_sets_used" TEXT,
    "partner_IG_link" TEXT,
    "REVO_twitter" TEXT DEFAULT 'not-posted',
    "REVO_tiktok" TEXT DEFAULT 'not-posted',
    "REVO_TT_view" INTEGER NOT NULL DEFAULT 0,
    "tiktok_accounts_used" TEXT DEFAULT 'not-posted',
    "partner_tiktok_link" TEXT DEFAULT 'not-posted',
    "partner_TT_like" INTEGER NOT NULL DEFAULT 0,
    "partner_TT_comment" INTEGER NOT NULL DEFAULT 0,
    "partner_TT_share" INTEGER NOT NULL DEFAULT 0,
    "partner_TT_view" INTEGER NOT NULL DEFAULT 0,
    "partner_TT_save" INTEGER NOT NULL DEFAULT 0,
    "TT_dummy_account_used" TEXT,
    "YT_account_used" TEXT DEFAULT 'not-posted',
    "partner_YT_link" TEXT DEFAULT 'not-posted',
    "partner_YT_like" INTEGER NOT NULL DEFAULT 0,
    "partner_YT_comment" INTEGER NOT NULL DEFAULT 0,
    "partner_YT_view" INTEGER NOT NULL DEFAULT 0,
    "partner_YT_save" INTEGER NOT NULL DEFAULT 0,
    "REVO_clubrevo_youtube" TEXT DEFAULT 'not-posted',
    "REVO_youtube" TEXT DEFAULT 'not-posted',
    "YT_clubrevo_like" INTEGER NOT NULL DEFAULT 0,
    "YT_clubrevo_view" INTEGER NOT NULL DEFAULT 0,
    "YT_REVOMADIC_like" INTEGER NOT NULL DEFAULT 0,
    "YT_REVOMADIC_comment" INTEGER NOT NULL DEFAULT 0,
    "YT_REVOMADIC_share" INTEGER NOT NULL DEFAULT 0,
    "YT_REVOMADIC_view" INTEGER NOT NULL DEFAULT 0,
    "creator_status" TEXT,
    "profile" TEXT,
    "posting_status" "PostingStatus" NOT NULL DEFAULT 'NOT_POSTED',
    "partner_HQ" TEXT,
    "portfolio" TEXT,
    "contributed_engagement" INTEGER NOT NULL DEFAULT 0,
    "by_tags" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "by_city" TEXT,
    "all_internet_search" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "records_pkey" PRIMARY KEY ("id")
);
