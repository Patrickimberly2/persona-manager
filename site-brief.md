# Persona Manager Site Brief

## Purpose
Provide a clear, trustworthy hub where teams can discover, customize, and adopt persona resources—avatars, role cards, and prompts—to accelerate product and marketing decisions.

## Goals
- **Primary:**
  - Drive downloads or selections of persona assets for active projects.
  - Capture qualified leads for collaboration or bespoke persona work.
  - Encourage account creation to save, remix, and share persona sets.
- **Secondary:**
  - Educate visitors on best practices for persona-driven planning.
  - Promote newsletters or webinars that keep users engaged.
  - Gather feedback that informs future persona content.

## KPIs
- Conversion rate from landing pages to asset download/selection.
- Lead form submissions and account sign-ups per week.
- Engagement depth (pages per session, time on customizable persona tools).
- Return visits and saved/shared persona sets.
- Newsletter or webinar registrations influenced by persona content pages.

## Architecture & Tooling Decisions
- **Frontend approach:** Adopt a hybrid Next.js app with server-rendered routes for gallery/detail pages and persona builder flows, while statically pre-rendering marketing content (Home, Resources, Blog listings) for speed. This keeps SEO strong, enables authenticated flows without a separate SPA shell, and still supports CDN-cached static assets for high-traffic pages.
- **CSS strategy:** Use Tailwind CSS (utility-first) with a small set of design tokens and component recipes (buttons, cards, filters). Tailwind accelerates layouting, keeps the bundle small via purge, and pairs well with a Figma-to-code handoff; component recipes prevent utility sprawl.
- **Form solution:** Implement forms through Next.js server actions/API routes backed by the primary database/CRM for lead capture and account creation, plus a fallback integration (e.g., Resend or SendGrid) for lightweight contact forms. This keeps data in-house for compliance while allowing quick iterations without relying on third-party form embeds.
- **Analytics & error monitoring:** Use Plausible for privacy-friendly product analytics (pageviews, conversions) and Sentry for frontend error monitoring and performance traces. Both have first-class Next.js integrations and support self-hosted or EU-friendly deployments.

## Target Audiences
- **Product & UX teams:** Need ready-to-use personas to speed discovery and testing.
- **Marketing strategists:** Seek relatable avatars to tailor campaigns and messaging.
- **Founders & innovation leads:** Want lightweight validation tools without building research muscle.
- **Agencies/consultants:** Require polished persona assets for client deliverables.

## Key User Journeys
- **Inspiration to action:** Homepage → Featured persona collection → Asset detail → Download/Save → Lead capture or account creation.
- **Customization workflow:** Homepage → Persona builder/role selector → Preview avatar & narrative → Save/share → Sign-up.
- **Education path:** Homepage → Guides/FAQ → Example use cases → Subscribe to updates.
- **Purchase/upgrade:** Homepage → Pricing/plan comparison → Checkout → Confirmation → Onboarding tips.

## Must-Have Features
- Clear hero with value proposition and primary CTA (download/try builder).
- Persona gallery with filters (role, industry, goal, maturity) and quick previews.
- Persona detail pages with avatars, narratives, and ready-to-use prompts.
- Persona builder/customizer with save/share options.
- Lead/contact form plus optional account registration and login.
- Pricing/plan page with checkout or upgrade path.
- Support content: guides/FAQ and help contact.

## Nice-to-Have Features
- Blog or newsroom for release notes and case studies.
- Webinar or event signup modules.
- Template starter kits for common scenarios (e.g., onboarding, marketing campaigns).
- Collaboration tools (comments, version history, shared collections).
- Localization for priority markets.
- Light personalization (recommend personas based on browsing behavior).

## Sitemap
- **Home**
  - Featured personas
  - Product pillars (gallery, builder, pricing, blog)
  - Testimonials & logos
  - Newsletter CTA
- **Personas**
  - Gallery (filters by role, industry, maturity)
  - Persona detail pages
  - Template starter kits
- **Persona Builder**
  - Role selector
  - Avatar customization
  - Prompt/narrative preview
  - Save/share flow
- **Pricing**
  - Plan comparison
  - Add-ons and usage limits
  - FAQ
  - Checkout
- **Resources**
  - Guides/FAQ
  - Case studies
  - Webinar signup
- **Blog**
  - Category archives
  - Individual posts
- **About**
  - Mission & team
  - Careers
  - Press kit
- **Contact**
  - Lead/contact form
  - Sales/email links
- **Account**
  - Sign up / log in
  - Saved persona sets
  - Billing & settings

## Page Outlines / Wireframe Notes
### Home
- **Hero:** Headline with primary CTA (Try the builder) and secondary CTA (View gallery); supporting visual of avatar set.
- **Value Props:** Three columns for speed, quality, collaboration with short blurbs and icons.
- **Featured Personas:** Carousel/grid of top persona cards with quick preview and “View detail” buttons.
- **Workflow Highlight:** Three-step graphic (Select role → Customize → Share) with CTA back to builder.
- **Testimonials & Logos:** Customer quotes, star ratings, and logo strip.
- **Content Teasers:** Latest blog posts and guide download card.
- **Secondary CTA:** Newsletter signup and contact link in footer band.

### Personas (Gallery + Detail)
- **Gallery Hero:** Filters (role, industry, goal, maturity) and search; CTA to open builder.
- **Grid/List:** Persona cards with avatar, role, and quick tags; hover for “Preview”/“Download”.
- **Detail Page:**
  - Hero with avatar, name, role, summary, and primary CTA (Download/Save).
  - Tabs for Narrative, Goals/Frustrations, Prompts, Assets.
  - Related personas and template kits.
  - Sticky side CTA for sign-up/save.

### Persona Builder
- **Hero/Intro:** Short explainer and primary CTA to start building; breadcrumb to gallery.
- **Role Selector:** Stepper with role filters and presets; preview card updates live.
- **Avatar Customization:** Controls for style, background, and accessories; live preview pane.
- **Prompt & Narrative Panel:** Editable fields for goals, scenarios, and instructions; AI assist toggle.
- **Save/Share:** Options to save to account, export, or copy prompt; gated sign-up modal.
- **Help Strip:** Link to guide and support chat.

### Pricing
- **Plan Cards:** Free/Pro/Enterprise comparison with CTAs (Start free, Upgrade, Talk to sales).
- **Feature Table:** Limits (personas/month, exports), collaboration, support tiers.
- **Add-ons:** Custom avatars, onboarding, SLA.
- **Social Proof:** Testimonials relevant to ROI.
- **FAQ:** Top 5 questions; contact CTA.
- **Checkout:** Embedded form or link to payment flow.

### Resources
- **Hero:** Value statement for learning; CTA to download starter kit.
- **Guides/FAQ:** Cards linking to guides; accordion FAQ.
- **Case Studies:** Highlight 2–3 stories with metrics.
- **Webinar Signup:** Upcoming/live sessions with registration CTA.
- **Support CTA:** Link to contact/help desk.

### Blog
- **Listing:** Featured post on top, followed by latest posts with tags and author info.
- **Sidebar:** Categories, newsletter signup, most-read posts.
- **Post Template:** Title/hero image, metadata, share buttons, in-article CTA, related posts.

### About
- **Hero:** Mission statement and snapshot metrics (customers, assets created).
- **Team:** Photos/bios of leadership; link to LinkedIn.
- **Careers:** Hiring blurb and link to openings.
- **Press Kit:** Download logos, product shots, and boilerplate copy.
- **Values/Approach:** Short pillars on research, inclusivity, quality.

### Contact
- **Lead Form:** Fields for name, email, role, use case, timeline.
- **Contact Methods:** Sales email, support chat link, office hours.
- **Map/Footprint:** Service regions or office.
- **CTA:** “Talk to an expert” scheduling link.

### Account
- **Auth Screens:** Sign up/login with SSO options.
- **Dashboard:** Recent persona sets, recommended assets, quick actions (Build new, Upload avatar).
- **Billing & Settings:** Plan, invoices, payment methods, team members.

## Asset Inventory & Owners
| Asset | Description | Owner/Author |
| --- | --- | --- |
| Logo suite (light/dark/SVG/PNG) | Brand marks for site, press, and downloads | Design lead |
| Persona avatar set | Core illustrated avatars used across gallery/detail pages | Design lead |
| Role cards | Standardized persona/role card layouts with prompts | Product design |
| Homepage hero copy | Headline, subhead, and CTA labels | Content strategist |
| Value prop blurbs | Short benefits for speed/quality/collaboration | Content strategist |
| Testimonials | Curated quotes with names/titles | Marketing ops |
| Plan/pricing copy | Plan names, feature bullets, limits, and legal notes | Product marketing |
| Blog articles | Thought leadership and release notes | Editorial lead |
| Guides/FAQ content | PDF/downloadable guides and FAQ entries | Customer education |
| Webinar assets | Landing copy, speaker bios, registration link | Events manager |
| Press kit | Logo bundle, product shots, boilerplate text | Communications |
| UI screenshots | Updated UI/flow captures for gallery and builder | Product design |
| CTA buttons & forms | Text strings for CTAs, form field labels, confirmation copy | UX writer |
| Legal pages | Privacy, terms, data processing addendum | Legal counsel |
