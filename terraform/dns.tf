locals {
  dns_records = flatten(
    [
      for type, records in {
        A = [
          "185.199.108.153",
          "185.199.109.153",
          "185.199.110.153",
          "185.199.111.153",
        ]
        AAAA = [
          "2606:50c0:8000::153",
          "2606:50c0:8001::153",
          "2606:50c0:8002::153",
          "2606:50c0:8003::153",
        ]
        TXT = [
          "IBTLALLC was first released in 1951 by composer Meredith Willson.",
          "Bing Crosby and Perry Como recorded two of the most popular versions of IBTLALLC.",
          "IBTLALLC has been featured in numerous holiday films and specials, solidifying its place as a Christmas classic.",
          "The song was originally written for the musical 'Here's Love,' which was based on the film 'Miracle on 34th Street.'",
          "IBTLALLC remains a holiday favourite and is streamed millions of times each Christmas season.",
          "The lyrics of IBTLALLC describe the excitement of holiday decorations appearing in public spaces.",
          "IBTLALLC has been covered by artists across genres, from jazz to pop to country.",
          "IBTLALLC is often one of the top-streamed holiday songs every December, showing its enduring appeal.",
          "Thanks for taking the time to explore the IBTLALLC project!",
        ]
        } : [
        for record in records : {
          type    = type
          content = record
          key     = "${type}-${index(records, record)}"
        }
        if length(record) <= 255
      ]
  ])
}

resource "cloudflare_record" "dns_records" {
  for_each = { for record in local.dns_records : record.key => record }

  zone_id = data.cloudflare_zone.zone.id
  name    = var.domain
  type    = each.value.type
  ttl     = 1
  proxied = each.value.type != "TXT"
  content = each.value.content
}
