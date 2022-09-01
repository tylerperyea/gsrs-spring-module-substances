package gsrs.module.substance.importers.importActionFactories;

import gsrs.dataexchange.model.MappingAction;
import gsrs.dataexchange.model.MappingActionFactoryMetadata;
import gsrs.dataexchange.model.MappingActionFactoryMetadataBuilder;
import gsrs.dataexchange.model.MappingParameter;
import gsrs.module.substance.importers.SDFImportAdapterFactory;
import gsrs.module.substance.importers.model.SDRecordContext;
import ix.core.models.Keyword;
import ix.ginas.models.v1.Reference;
import ix.ginas.models.v1.Substance;
import lombok.extern.slf4j.Slf4j;

import java.util.*;

import static gsrs.module.substance.importers.SDFImportAdapterFactory.resolveParametersMap;

@Slf4j
public class ReferenceExtractorActionFactory extends BaseActionFactory {
    public MappingAction<Substance, SDRecordContext> create(Map<String, Object> abstractParams) {
        return (sub, sdRec) -> {
            log.trace("in create");
            Map<String, Object> params = resolveParametersMap(sdRec, abstractParams);
            Reference r = new Reference();
            r.citation = (String) params.get("citation");
            if( r.citation.equalsIgnoreCase(SDFImportAdapterFactory.REFERENCE_INSTRUCTION)) {
                r.citation= String.format("File %s imported on %s", getAdapterSchema().get("fileName"), new Date());
            }
            r.docType = (String) params.get("docType");
            r.publicDomain = params.get("publicDomain")!=null && params.get("publicDomain").toString().equalsIgnoreCase("true");

            List<String> tags = params.get("tags") !=null ? (List<String>) params.get("tags") : null;
            if( tags!=null) {
                tags.forEach(t->r.tags.add(new Keyword(t)));
            }
            Optional.ofNullable(params.get("url")).ifPresent(url -> {
                r.url = url.toString();
            });
            /*Optional.ofNullable(params.get("referenceID")).ifPresent(rid -> {
                r.id = rid.toString();
            });*/
            doBasicsImports(r, params);
            //TODO: more params
            sub.addReference(r);
            return sub;
        };
    }

    @Override
    public MappingActionFactoryMetadata getMetadata() {
        MappingActionFactoryMetadataBuilder builder = new MappingActionFactoryMetadataBuilder();
        return builder.setLabel("Create Reference")
                .addParameterField(MappingParameter.builder()
                        .setFieldName("citation")
                        .setValueType(String.class)
                        .setRequired(true)
                        .build())
                .addParameterField(MappingParameter.builder()
                        .setFieldName("docType")
                        .setValueType(String.class)
                        .setRequired(true)
                        .build())
                .addParameterField(MappingParameter.builder()
                        .setFieldName("url")
                        .setValueType(String.class)
                        .setDefaultValue("PRIMARY")
                        .build())
                .addParameterField(MappingParameter.builder()
                        .setFieldName("referenceID")
                        .setValueType(String.class)
                        .setDefaultValue("PRIMARY")
                        .build())
                .addParameterField(MappingParameter.builder()
                        .setFieldName("publicDomain")
                        .setValueType(Boolean.class)
                        .setDefaultValue(true)
                        .build())
                .build();
    }

}
