%----------------------------------------------------------------------------
%----------------------------------------------------------------------------


-module (ms_os_rest).


-export ([
		rest_accept_content/4,
		rest_provide_content/4,
		rest_resource_exists/3,
		rest_delete/3,
		rest_cache/4]).


%----------------------------------------------------------------------------
%----------------------------------------------------------------------------


-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>],
		{true, [get], [], [{json, utf8}, json]},
		{collections}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection],
		{true, [get], [], [{json, utf8}, json]},
		{collection}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>],
		{true, [get], [], [{json, utf8}, json]},
		{collection, objects}}).


-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object],
		{true, [get, put, delete], [{json, utf8}, json], [{json, utf8}, json]},
		{object}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object, <<"data">>],
		{true, [get, put, delete], [any], [any]},
		{object, data}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object, <<"indices">>],
		{true, [get, put, delete], [{json, utf8}, json], [{json, utf8}, json]},
		{object, indices}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object, <<"indices">>, index],
		{true, [get, put, delete], [{json, utf8}, json], [{json, utf8}, json]},
		{object, index}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object, <<"links">>],
		{true, [get, put, delete], [{json, utf8}, json], [{json, utf8}, json]},
		{object, links}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object, <<"links">>, link],
		{true, [get, put, delete], [{json, utf8}, json], [{json, utf8}, json]},
		{object, link}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object, <<"links">>, link, reference],
		{true, [get, put, delete], [{json, utf8}, json], [{json, utf8}, json]},
		{object, link, reference}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object, <<"links">>, link, reference, <<"object">>],
		{true, [get], [], [any]},
		{object, link, reference, redirect}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object, <<"links">>, link, reference, <<"object">>, '...'],
		{true, [get], [], [any]},
		{object, link, reference, redirect}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object, <<"attachments">>],
		{true, [get, put, delete], [{json, utf8}, json], [{json, utf8}, json]},
		{object, attachments}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object, <<"attachments">>, attachment],
		{true, [get, put, delete], [{json, utf8}, json], [{json, utf8}, json]},
		{object, attachment}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object, <<"attachments">>, attachment, <<"data">>],
		{false, [get], [], [any]},
		{object, attachment, data}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object, <<"attachments">>, attachment, <<"annotations">>],
		{true, [get, put, delete], [{json, utf8}, json], [{json, utf8}, json]},
		{object, attachment, annotations}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object, <<"attachments">>, attachment, <<"annotations">>, annotation],
		{true, [get, put, delete], [{json, utf8}, json], [{json, utf8}, json]},
		{object, attachment, annotation}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object, <<"annotations">>],
		{true, [get, put, delete], [{json, utf8}, json], [{json, utf8}, json]},
		{object, annotations}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"collections">>, collection, <<"objects">>, object, <<"annotations">>, annotation],
		{true, [get, put, delete], [{json, utf8}, json], [{json, utf8}, json]},
		{object, annotation}}).


-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"indices">>],
		{true, [get], [], [{json, utf8}, json]},
		{indices}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"indices">>, index],
		{true, [get], [], [{json, utf8}, json]},
		{index}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"indices">>, index, <<"select">>, <<"equals">>, value],
		{true, [get], [], [{json, utf8}, json]},
		{index, select, equals}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"indices">>, index, <<"select">>, <<"lesser">>, max_value],
		{true, [get], [], [{json, utf8}, json]},
		{index, select, lesser}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"indices">>, index, <<"select">>, <<"greater">>, min_value],
		{true, [get], [], [{json, utf8}, json]},
		{index, select, greater}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"indices">>, index, <<"select">>, <<"range">>, min_value, max_value],
		{true, [get], [], [{json, utf8}, json]},
		{index, select, range}}).


-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"attachments">>],
		{false, [get], [], [{json, utf8}, json]},
		{attachments}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"attachments">>, attachment],
		{false, [get], [], [{json, utf8}, json]},
		{attachment}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"attachments">>, attachment, <<"data">>],
		{false, [get], [], [any]},
		{attachment, data}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"attachments">>, attachment, <<"annotations">>],
		{false, [get, put, delete], [{json, utf8}, json], [{json, utf8}, json]},
		{attachment, annotations}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"attachments">>, attachment, <<"annotations">>, annotation],
		{false, [get, put, delete], [{json, utf8}, json], [{json, utf8}, json]},
		{attachment, annotation}}).


-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"export">>],
		{true, [get], [], [{json, utf8}, json]},
		{export}}).

-ve_cowboy_rest_route ({
		any, [<<"v1">>, <<"import">>],
		{true, [post], [{json, utf8}, json], [any]},
		{import}}).


%----------------------------------------------------------------------------
%----------------------------------------------------------------------------


-import (ve_enforcements, [enforce_ok/1, enforce_ok_1/1, enforce_ok_2/1, enforce_ok_map/2, enforce_ok_foreach/2]).


-include ("ms_os_coders.hrl").


%----------------------------------------------------------------------------


rest_accept_content (ContentType, Rest, Request, State) ->
	try
		{Content, Request_2} = enforce_ok_2 (ve_cowboy:accept_content (ContentType, Request, true)),
		case {State, ContentType} of
			
			{{object}, {json, utf8}} ->
				Object = enforce_ok_1 (ms_os_coders:decode_json_object (Content, false)),
				{ObjectKey, ObjectExists} = Rest ({cache, object_key_and_exists}),
				if
					ObjectExists ->
						enforce_ok (ms_os_api:object_update (ObjectKey, Object));
					true ->
						enforce_ok (ms_os_api:object_create (ObjectKey, Object))
				end,
				{ok, true, Request_2};
			
			{{object, data}, ContentType} ->
				{ObjectKey, ObjectExists} = Rest ({cache, object_key_and_exists}),
				if
					ObjectExists ->
						enforce_ok (ms_os_api:object_update_data (ObjectKey, ContentType, Content));
					true ->
						enforce_ok (ms_os_api:object_create_data (ObjectKey, ContentType, Content))
				end,
				{ok, true, Request_2};
			
			{{object, indices}, {json, utf8}} ->
				Indices = enforce_ok_1 (ms_os_coders:decode_json_object_indices (Content)),
				{ObjectKey, ObjectExists} = Rest ({cache, object_key_and_exists}),
				if
					ObjectExists ->
						enforce_ok (ms_os_api:object_patch (ObjectKey, {indices_all, update, Indices})),
						{ok, true, Request_2};
					true ->
						{ok, false, Request_2}
				end;
			
			{{object, index}, {json, utf8}} ->
				IndexValues = enforce_ok_1 (ms_os_coders:decode_json_object_index_values (Content)),
				{ObjectKey, ObjectExists} = Rest ({cache, object_key_and_exists}),
				if
					ObjectExists ->
						IndexKey = Rest ({cache, object_index_key}),
						IndexExists = (Rest ({cache, object_index}) =/= missing),
						if
							IndexExists ->
								enforce_ok (ms_os_api:object_patch (ObjectKey, {index, update, {IndexKey, IndexValues}})),
								{ok, true, Request_2};
							true ->
								enforce_ok (ms_os_api:object_patch (ObjectKey, {index, include, {IndexKey, IndexValues}})),
								{ok, true, Request_2}
						end;
					true ->
						{ok, false, Request_2}
				end;
			
			{{object, links}, {json, utf8}} ->
				Links = enforce_ok_1 (ms_os_coders:decode_json_object_links (Content)),
				{ObjectKey, ObjectExists} = Rest ({cache, object_key_and_exists}),
				if
					ObjectExists ->
						enforce_ok (ms_os_api:object_patch (ObjectKey, {links_all, update, Links})),
						{ok, true, Request_2};
					true ->
						{ok, false, Request_2}
				end;
			
			{{object, link}, {json, utf8}} ->
				LinkReferences = enforce_ok_1 (ms_os_coders:decode_json_object_link_references (Content)),
				{ObjectKey, ObjectExists} = Rest ({cache, object_key_and_exists}),
				if
					ObjectExists ->
						LinkKey = Rest ({cache, object_link_key}),
						LinkExists = (Rest ({cache, object_link}) =/= missing),
						if
							LinkExists ->
								enforce_ok (ms_os_api:object_patch (ObjectKey, {link, update, {LinkKey, LinkReferences}})),
								{ok, true, Request_2};
							true ->
								enforce_ok (ms_os_api:object_patch (ObjectKey, {link, include, {LinkKey, LinkReferences}})),
								{ok, true, Request_2}
						end;
					true ->
						{ok, false, Request_2}
				end;
			
			{{object, link, reference}, {json, utf8}} ->
				LinkReference = enforce_ok_1 (ms_os_coders:decode_json_object_link_reference (Content)),
				{ObjectKey, ObjectExists} = Rest ({cache, object_key_and_exists}),
				if
					ObjectExists ->
						LinkKey = Rest ({cache, object_link_key}),
						LinkExists = (Rest ({cache, object_link}) =/= missing),
						if
							LinkExists ->
								LinkReferenceExists = (Rest ({cache, object_link_reference}) =/= missing),
								if
									LinkReferenceExists ->
										enforce_ok (ms_os_api:object_patch (ObjectKey,
												{patches, [
														{link_reference, exclude, LinkKey, Rest ({cache, object_link_reference})},
														{link_reference, include, LinkKey, LinkReference}]})),
										{ok, true, Request_2};
									true ->
										{ok, false, Request_2}
								end;
							true ->
								{ok, false, Request_2}
						end;
					true ->
						{ok, false, Request_2}
				end;
			
			{{object, attachments}, {json, utf8}} ->
				Attachments = enforce_ok_1 (ms_os_coders:decode_json_object_attachments (Content)),
				{ObjectKey, ObjectExists} = Rest ({cache, object_key_and_exists}),
				if
					ObjectExists ->
						enforce_ok (ms_os_api:object_patch (ObjectKey, {attachments_all, update, Attachments})),
						{ok, true, Request_2};
					true ->
						{ok, false, Request_2}
				end;
			
			{{object, attachment}, {json, utf8}} ->
				Attachment_0 = enforce_ok_1 (ms_os_coders:decode_json_object_attachment (Content, true)),
				{ObjectKey, ObjectExists} = Rest ({cache, object_key_and_exists}),
				if
					ObjectExists ->
						AttachmentKey = Rest ({cache, object_attachment_key}),
						AttachmentExists = (Rest ({cache, object_attachment}) =/= missing),
						Attachment = Attachment_0#ms_os_attachment_v1{key = AttachmentKey},
						if
							AttachmentExists ->
								enforce_ok (ms_os_api:object_patch (ObjectKey, {attachment, update, Attachment})),
								{ok, true, Request_2};
							true ->
								enforce_ok (ms_os_api:object_patch (ObjectKey, {attachment, include, Attachment})),
								{ok, true, Request_2}
						end;
					true ->
						{ok, false, Request_2}
				end;
			
			{{object, attachment, annotations}, {json, utf8}} ->
				Annotations = enforce_ok_1 (ms_os_coders:decode_json_object_annotations (Content)),
				{ObjectKey, ObjectExists} = Rest ({cache, object_key_and_exists}),
				if
					ObjectExists ->
						AttachmentKey = Rest ({cache, object_attachment_key}),
						AttachmentExists = (Rest ({cache, object_attachment}) =/= missing),
						if
							AttachmentExists ->
								enforce_ok (ms_os_api:object_patch (ObjectKey, {attachment_annotations_all, update, AttachmentKey, Annotations})),
								{ok, true, Request_2};
							true ->
								{ok, false, Request_2}
						end;
					true ->
						{ok, false, Request_2}
				end;
			
			{{object, attachment, annotation}, {json, utf8}} ->
				AnnotationValue = enforce_ok_1 (ms_os_coders:decode_json_object_annotation_value (Content)),
				{ObjectKey, ObjectExists} = Rest ({cache, object_key_and_exists}),
				if
					ObjectExists ->
						AttachmentKey = Rest ({cache, object_attachment_key}),
						AttachmentExists = (Rest ({cache, object_attachment}) =/= missing),
						if
							AttachmentExists ->
								AnnotationKey = Rest ({cache, object_attachment_annotation_key}),
								AnnotationExists = (Rest ({cache, object_attachment_annotation}) =/= missing),
								if
									AnnotationExists ->
										enforce_ok (ms_os_api:object_patch (ObjectKey, attachment_annotation, update, {AttachmentKey, AnnotationKey, AnnotationValue})),
										{ok, true, Request_2};
									true ->
										enforce_ok (ms_os_api:object_patch (ObjectKey, attachment_annotation, include, {AttachmentKey, AnnotationKey, AnnotationValue})),
										{ok, true, Request_2}
								end;
							true ->
								{ok, false, Request_2}
						end;
					true ->
						{ok, false, Request_2}
				end;
			
			{{object, annotations}, {json, utf8}} ->
				Annotations = enforce_ok_1 (ms_os_coders:decode_json_object_annotations (Content)),
				{ObjectKey, ObjectExists} = Rest ({cache, object_key_and_exists}),
				if
					ObjectExists ->
						enforce_ok (ms_os_api:object_patch (ObjectKey, {annotations, update, Annotations})),
						{ok, true, Request_2};
					true ->
						{ok, false, Request_2}
				end;
			
			{{object, annotation}, {json, utf8}} ->
				AnnotationValue = enforce_ok_1 (ms_os_coders:decode_json_object_annotation_value (Content)),
				{ObjectKey, ObjectExists} = Rest ({cache, object_key_and_exists}),
				if
					ObjectExists ->
						AnnotationKey = Rest ({cache, object_annotation_key}),
						AnnotationExists = (Rest ({cache, object_annotation}) =/= missing),
						if
							AnnotationExists ->
								enforce_ok (ms_os_api:object_patch (ObjectKey, {annotation, update, {AnnotationKey, AnnotationValue}})),
								{ok, true, Request_2};
							true ->
								enforce_ok (ms_os_api:object_patch (ObjectKey, {annotation, include, {AnnotationKey, AnnotationValue}})),
								{ok, true, Request_2}
						end;
					true ->
						{ok, false, Request_2}
				end;
			
			{{import}, {json, utf8}} ->
				Objects = enforce_ok_1 (ms_os_coders:decode_json_objects (Content)),
				Outcomes = lists:filtermap (
						fun (Object) ->
							case ms_os_api:object_create (Object) of
								ok ->
									false;
								{error, Reason} ->
									{true, {Reason, Object}}
							end
						end,
						Objects),
				case Outcomes of
					[] ->
						{ok, true, Request_2};
					_ ->
						{error, Outcomes, Request_2}
				end;
			
			{RequestedResource, RequestedContentType} ->
				{error, {not_supported, RequestedResource, RequestedContentType}}
		end
	of Outcome_X ->
		rest_return (Outcome_X, Request, State)
	catch
		throw : Error_X = {error, _} ->
			rest_return (Error_X, Request, State);
		throw : Error_X = {error, _, _} ->
			rest_return (Error_X, Request, State)
	end.


%----------------------------------------------------------------------------


rest_provide_content (ContentType, Rest, Request, State) ->
	try
		case State of
			
			{object} ->
				Json = enforce_ok_1 (ms_os_coders:encode_json_object (Rest ({cache, object}), false)),
				{content, {json, utf8}, Json};
			{object, data} ->
				{BinaryContentType, BinaryContent} = enforce_ok_2 (ms_os_coders:encode_binary_data (Rest ({cache, object_data}))),
				{content, {encoded, BinaryContentType}, BinaryContent};
			{object, indices} ->
				Json = enforce_ok_1 (ms_os_coders:encode_json_object_indices (Rest ({cache, object_indices}))),
				{content, {json, utf8}, Json};
			{object, index} ->
				Json = enforce_ok_1 (ms_os_coders:encode_json_object_index_values (Rest ({cache, object_index}))),
				{content, {json, utf8}, Json};
			{object, links} ->
				Json = enforce_ok_1 (ms_os_coders:encode_json_object_links (Rest ({cache, object_links}))),
				{content, {json, utf8}, Json};
			{object, link} ->
				Json = enforce_ok_1 (ms_os_coders:encode_json_object_link_references (Rest ({cache, object_link}))),
				{content, {json, utf8}, Json};
			{object, link, reference} ->
				Json = enforce_ok_1 (ms_os_coders:encode_json_object_link_reference (Rest ({cache, object_link_reference}))),
				{content, {json, utf8}, Json};
			{object, attachments} ->
				Json = enforce_ok_1 (ms_os_coders:encode_json_object_attachments (Rest ({cache, object_attachments}))),
				{content, {json, utf8}, Json};
			{object, attachment} ->
				Json = enforce_ok_1 (ms_os_coders:encode_json_object_attachment (Rest ({cache, object_attachment}))),
				{content, {json, utf8}, Json};
			{object, attachment, annotations} ->
				Json = enforce_ok_1 (ms_os_coders:encode_json_object_annotations (Rest ({cache, object_attachment_annotations}))),
				{content, {json, utf8}, Json};
			{object, attachment, annotation} ->
				Json = enforce_ok_1 (ms_os_coders:encode_json_object_annotation_value (Rest ({cache, object_attachment_annotation}))),
				{content, {json, utf8}, Json};
			{object, annotations} ->
				Json = enforce_ok_1 (ms_os_coders:encode_json_object_annotations (Rest ({cache, object_annotations}))),
				{content, {json, utf8}, Json};
			{object, annotation} ->
				Json = enforce_ok_1 (ms_os_coders:encode_json_object_annotation_value (Rest ({cache, object_annotation}))),
				{content, {json, utf8}, Json};
			
			{collections} ->
				{content, {json, utf8}, null};
			{collection} ->
				{content, {json, utf8}, null};
			{collection, objects} ->
				ObjectKeys = enforce_ok_1 (ms_os_api:objects_select ({collection, Rest ({cache, collection_key})}, {key, object})),
				Json = enforce_ok_map (fun ms_os_coders:encode_json_identifier/1, ObjectKeys),
				{content, {json, utf8}, Json};
			
			{indices} ->
				{content, {json, utf8}, null};
			{index} ->
				{content, {json, utf8}, null};
			{index, select, equals} ->
				Value = enforce_ok_1 (ms_os_coders:decode_json_object_index_value (enforce_ok_1 (ve_json_coders:decode_json (Rest ({binding, value}))))),
				ObjectKeys = enforce_ok_1 (ms_os_api:objects_select ({index, Rest ({cache, index_key}), {equals, Value}}, key)),
				Json = enforce_ok_map (fun ms_os_coders:encode_json_object_key/1, ObjectKeys),
				{content, {json, utf8}, Json};
			{index, select, lesser} ->
				MaxValue = enforce_ok_1 (ms_os_coders:decode_json_object_index_value (enforce_ok_1 (ve_json_coders:decode_json (Rest ({binding, max_value}))))),
				ObjectKeys = enforce_ok_1 (ms_os_api:objects_select ({index, Rest ({cache, index_key}), {lesser, MaxValue}}, key)),
				Json = enforce_ok_map (fun ms_os_coders:encode_json_object_key/1, ObjectKeys),
				{content, {json, utf8}, Json};
			{index, select, greater} ->
				MinValue = enforce_ok_1 (ms_os_coders:decode_json_object_index_value (enforce_ok_1 (ve_json_coders:decode_json (Rest ({binding, min_value}))))),
				ObjectKeys = enforce_ok_1 (ms_os_api:objects_select ({index, Rest ({cache, index_key}), {greater, MinValue}}, key)),
				Json = enforce_ok_map (fun ms_os_coders:encode_json_object_key/1, ObjectKeys),
				{content, {json, utf8}, Json};
			{index, select, range} ->
				MinValue = enforce_ok_1 (ms_os_coders:decode_json_object_index_value (enforce_ok_1 (ve_json_coders:decode_json (Rest ({binding, min_value}))))),
				MaxValue = enforce_ok_1 (ms_os_coders:decode_json_object_index_value (enforce_ok_1 (ve_json_coders:decode_json (Rest ({binding, max_value}))))),
				ObjectKeys = enforce_ok_1 (ms_os_api:objects_select ({index, Rest ({cache, index_key}), {range, MinValue, MaxValue}}, key)),
				Json = enforce_ok_map (fun ms_os_coders:encode_json_object_key/1, ObjectKeys),
				{content, {json, utf8}, Json};
			
			{export} ->
				Objects = enforce_ok_1 (ms_os_api:objects_select (any, object)),
				Json = enforce_ok_map (fun ms_os_coders:encode_json_object/1, Objects),
				{content, {json, utf8}, Json};
			
			RequestedResource ->
				{error, {not_supported, RequestedResource, ContentType}}
		end
	of Outcome_X ->
		rest_return (Outcome_X, Request, State)
	catch
		throw : Error_X = {error, _} ->
			rest_return (Error_X, Request, State);
		throw : Error_X = {error, _, _} ->
			rest_return (Error_X, Request, State)
	end.


%----------------------------------------------------------------------------


rest_delete (Rest, Request, State) ->
	try
		case State of
			
			{object} ->
				enforce_ok (ms_os_api:object_destroy (Rest ({cache, object_key}))),
				{ok, true};
			{object, data} ->
				enforce_ok (ms_os_api:object_destroy_data (Rest ({cache, object_key}))),
				{ok, true};
			{object, indices} ->
				enforce_ok (ms_os_api:object_patch (Rest ({cache, object_key}), {indices_all, exclude})),
				{ok, true};
			{object, index} ->
				enforce_ok (ms_os_api:object_patch (Rest ({cache, object_key}), {index, exclude, Rest ({cache, object_index_key})})),
				{ok, true};
			{object, links} ->
				enforce_ok (ms_os_api:object_patch (Rest ({cache, object_key}), {links_all, exclude})),
				{ok, true};
			{object, link} ->
				enforce_ok (ms_os_api:object_patch (Rest ({cache, object_key}), {link, exclude, Rest ({cache, object_link_key})})),
				{ok, true};
			{object, link, reference} ->
				enforce_ok (ms_os_api:object_patch (Rest ({cache, object_key}), {link_reference, exclude, Rest ({cache, object_link_key}), Rest ({cache, object_link_reference})})),
				{ok, true};
			{object, attachments} ->
				enforce_ok (ms_os_api:object_patch (Rest ({cache, object_key}), {attachments_all, exclude})),
				{ok, true};
			{object, attachment} ->
				enforce_ok (ms_os_api:object_patch (Rest ({cache, object_key}), {attachment, exclude, Rest ({cache, object_attachment_key})})),
				{ok, true};
			{object, attachment, annotations} ->
				enforce_ok (ms_os_api:object_patch (Rest ({cache, object_key}), {attachment_annotations_all, exclude, Rest ({cache, object_attachment_key})})),
				{ok, true};
			{object, attachment, annotation} ->
				enforce_ok (ms_os_api:object_patch (Rest ({cache, object_key}), {attachment_annotation, exclude, Rest ({cache, object_attachment_key}), Rest ({cache, object_attachment_annotation})})),
				{ok, true};
			{object, annotations} ->
				enforce_ok (ms_os_api:object_patch (Rest ({cache, object_key}), {annotations_all, exclude})),
				{ok, true};
			{object, annotation} ->
				enforce_ok (ms_os_api:object_patch (Rest ({cache, object_key}), {annotation, exclude, Rest ({cache, object_annotation_key})})),
				{ok, true};
			
			RequestedResource ->
				{error, {not_supported, RequestedResource}}
		end
	of Outcome_X ->
		rest_return (Outcome_X, Request, State)
	catch
		throw : Error_X = {error, _} ->
			rest_return (Error_X, Request, State);
		throw : Error_X = {error, _, _} ->
			rest_return (Error_X, Request, State)
	end.


%----------------------------------------------------------------------------


rest_resource_exists (Rest, Request, State) ->
	try
		case State of
			
			{object} ->
				{ok, Rest ({cache, object}) =/= missing};
			{object, data} ->
				{ok, Rest ({cache, object_data}) =/= missing};
			{object, indices} ->
				{ok, Rest ({cache, object_indices}) =/= missing};
			{object, index} ->
				{ok, Rest ({cache, object_index}) =/= missing};
			{object, links} ->
				{ok, Rest ({cache, object_links}) =/= missing};
			{object, link} ->
				{ok, Rest ({cache, object_link}) =/= missing};
			{object, link, reference} ->
				{ok, Rest ({cache, object_link_reference}) =/= missing};
			{object, attachments} ->
				{ok, Rest ({cache, object_attachments}) =/= missing};
			{object, attachment} ->
				{ok, Rest ({cache, object_attachment}) =/= missing};
			{object, attachment, annotations} ->
				{ok, Rest ({cache, object_attachment_annotations}) =/= missing};
			{object, attachment, annotation} ->
				{ok, Rest ({cache, object_attachment_annotation}) =/= missing};
			{object, annotations} ->
				{ok, Rest ({cache, object_annotations}) =/= missing};
			{object, annotation} ->
				{ok, Rest ({cache, object_annotation}) =/= missing};
			
			{object, link, reference, redirect} ->
				Exists = (Rest ({cache, object_link_reference}) =/= missing),
				if
					Exists ->
						{ok, {moved, temporarily, Rest ({cache, object_link_reference_redirect})}};
					true ->
						{ok, false}
				end;
			
			{object, attachment, data} ->
				Exists = (Rest ({cache, object_attachment}) =/= missing),
				if
					Exists ->
						{ok, {moved, temporarily, Rest ({cache, object_attachment_data_redirect})}};
					true ->
						{ok, false}
				end;
			
			{collections} ->
				{ok, true};
			{collection} ->
				{ok, true};
			{collection, objects} ->
				{ok, true};
			
			{indices} ->
				{ok, true};
			{index} ->
				{ok, true};
			{index, select, equals} ->
				{ok, true};
			{index, select, lesser} ->
				{ok, true};
			{index, select, greater} ->
				{ok, true};
			{index, select, range} ->
				{ok, true};
			
			{export} ->
				{ok, true};
			{import} ->
				{ok, true};
			
			RequestedResource ->
				{error, {not_supported, RequestedResource}}
		end
	of Outcome_X ->
		rest_return (Outcome_X, Request, State)
	catch
		throw : Error_X = {error, _} ->
			rest_return (Error_X, Request, State);
		throw : Error_X = {error, _, _} ->
			rest_return (Error_X, Request, State)
	end.


%----------------------------------------------------------------------------


rest_cache (collection_key, Rest, _, _) ->
	ms_os_coders:coerce_identifier (Rest ({binding, collection}));
	
rest_cache (object_key_collection, Rest, Request, State) ->
	rest_cache (collection_key, Rest, Request, State);
	
rest_cache (object_key_object, Rest, _, _) ->
	ms_os_coders:coerce_identifier (Rest ({binding, object}));
	
rest_cache (object_key, Rest, _, _) ->
	ms_os_coders:coerce_object_key (
			Rest ({cache, object_key_collection}),
			Rest ({cache, object_key_object}));
	
rest_cache (object_exists, Rest, _, _) ->
	case Rest ({cache, object}) of
		missing ->
			{ok, false};
		_Object ->
			{ok, true}
	end;
	
rest_cache (object_key_and_exists, Rest, _, _) ->
	{ok, {Rest ({cache, object_key}), Rest ({cache, object_exists})}};
	
rest_cache (object, Rest, _, _) ->
	case ms_os_api:object_select (Rest ({cache, object_key})) of
		{ok, Object} ->
			{ok, Object};
		{error, missing} ->
			{ok, missing};
		Error = {error, _} ->
			Error
	end;
	
rest_cache (object_data, Rest, _, _) ->
	case Rest ({cache, object}) of
		missing ->
			{ok, missing};
		Object ->
			case Object#ms_os_object_v1.data of
				none ->
					{ok, missing};
				Data ->
					{ok, Data}
			end
	end;
	
rest_cache (object_indices, Rest, _, _) ->
	case Rest ({cache, object}) of
		missing ->
			{ok, missing};
		Object ->
			{ok, Object#ms_os_object_v1.indices}
	end;
	
rest_cache (object_index_key, Rest, _, _) ->
	ms_os_coders:coerce_identifier (Rest ({binding, index}));
	
rest_cache (object_index, Rest, Request, State) ->
	rest_cache ({lists_keyfind, 2, 0, object_index_key, object_indices}, Rest, Request, State);
	
rest_cache (object_links, Rest, _, _) ->
	case Rest ({cache, object}) of
		missing ->
			{ok, missing};
		Object ->
			{ok, Object#ms_os_object_v1.links}
	end;
	
rest_cache (object_link_key, Rest, _, _) ->
	ms_os_coders:coerce_identifier (Rest ({binding, link}));
	
rest_cache (object_link, Rest, Request, State) ->
	rest_cache ({lists_keyfind, 2, 0, object_link_key, object_links}, Rest, Request, State);
	
rest_cache (object_link_references, Rest, _, _) ->
	case Rest ({cache, object_link}) of
		missing ->
			{ok, missing};
		Object ->
			{ok, Object#ms_os_object_link_v1.references}
	end;
	
rest_cache (object_link_reference_key, Rest, _, _) ->
	% FIXME: Verify that the index is positive
	ve_generic_coders:decode_integer (Rest ({binding, reference}));
	
rest_cache (object_link_reference, Rest, Request, State) ->
	rest_cache ({lists_element, object_link_reference_key, object_link_references}, Rest, Request, State);
	
rest_cache (object_link_reference_redirect, Rest, _, _) ->
	Link = Rest ({cache, object_link_reference}),
	Collection = Link#ms_os_object_key_v1.collection,
	Object = Link#ms_os_object_key_v1.object,
	PathTail = Rest ({binding, '...'}),
	Url = case PathTail of
		[] ->
			<<"/v1/collections/", Collection/binary, "/objects/", Object/binary>>;
		_ ->
			UrlTail = erlang:iolist_to_binary ([[<<"/">>, PathElement] || PathElement <- PathTail]),
			<<"/v1/collections/", Collection/binary, "/objects/", Object/binary, UrlTail/binary>>
	end,
	{ok, Url};
	
rest_cache (object_attachments, Rest, _, _) ->
	case Rest ({cache, object}) of
		missing ->
			{ok, missing};
		Object ->
			{ok, Object#ms_os_object_v1.attachments}
	end;
	
rest_cache (object_attachment_key, Rest, _, _) ->
	ms_os_coders:coerce_identifier (Rest ({binding, attachment}));
	
rest_cache (object_attachment, Rest, Request, State) ->
	rest_cache ({lists_keyfind, 1, 2, object_attachment_key, object_attachments}, Rest, Request, State);
	
rest_cache (object_attachment_annotations, Rest, _, _) ->
	case Rest ({cache, object_attachment}) of
		missing ->
			{ok, missing};
		Attachment ->
			{ok, Attachment#ms_os_attachment_v1.annotations}
	end;
	
rest_cache (object_attachment_annotation_key, Rest, _, _) ->
	ms_os_coders:coerce_identifier (Rest ({binding, annotation}));
	
rest_cache (object_attachment_annotation, Rest, Request, State) ->
	rest_cache ({lists_keyfind, 2, 0, object_attachment_annotation_key, object_attachment_annotations}, Rest, Request, State);
	
rest_cache (object_annotations, Rest, _, _) ->
	case Rest ({cache, object}) of
		missing ->
			{ok, missing};
		Object ->
			{ok, Object#ms_os_object_v1.annotations}
	end;
	
rest_cache (object_annotation_key, Rest, _, _) ->
	ms_os_coders:coerce_identifier (Rest ({binding, annotation}));
	
rest_cache (object_annotation, Rest, Request, State) ->
	rest_cache ({lists_keyfind, 2, 0, object_annotation_key, object_annotations}, Rest, Request, State);
	
rest_cache (index_key, Rest, _, _) ->
	ms_os_coders:coerce_identifier (Rest ({binding, index}));
	
rest_cache ({lists_keyfind, KeyPosition, Selector, KeyReference, ListReference}, Rest, _, _) ->
	case Rest ({cache, ListReference}) of
		missing ->
			{ok, missing};
		List ->
			Key = Rest ({cache, KeyReference}),
			case lists:keyfind (Key, KeyPosition, List) of
				false ->
					{ok, missing};
				Tuple ->
					case Selector of
						0 ->
							{ok, Tuple};
						_ ->
							{ok, erlang:element (Selector, Tuple)}
					end
			end
	end;
	
rest_cache ({lists_element, KeyReference, ListReference}, Rest, _, _) ->
	case Rest ({cache, ListReference}) of
		missing ->
			{ok, missing};
		List ->
			Key = Rest ({cache, KeyReference}),
			ListLength = erlang:length (List),
			if
				Key >= 0, Key < ListLength ->
					{ok, lists:nth (Key + 1, List)};
				true ->
					{ok, missing}
			end
	end.


%----------------------------------------------------------------------------


rest_return ({content, ContentType, Content}, Request, State) ->
	{cowboy, ve_cowboy:provide_content (ContentType, Content, Request, State)};
	
rest_return ({outcome, ContentType, Outcome}, Request, State) ->
	{cowboy, ve_cowboy:provide_outcome (ContentType, Outcome, Request, State)};
	
rest_return ({ok, Value}, Request, State) ->
	{ok, Value, Request, State};
	
rest_return ({ok, Value, NewRequest}, _OldRequest, State) ->
	{ok, Value, NewRequest, State};
	
rest_return ({ok, Value, NewRequest, NewState}, _OldRequest, _OldState) ->
	{ok, Value, NewRequest, NewState};
	
rest_return (Error = {error, Reason}, Request, State) ->
	ve_transcript:trace_warning ("rest request failed; replying!", [{reason, Reason}]),
	{cowboy, ve_cowboy:provide_outcome ({json, utf8}, Error, Request, State)};
	
rest_return ({error, Reason, NewRequest}, _OldRequest, State) ->
	rest_return ({error, Reason}, NewRequest, State);
	
rest_return ({error, Reason, NewRequest, NewState}, _OldRequest, _OldState) ->
	rest_return ({error, Reason}, NewRequest, NewState).


%----------------------------------------------------------------------------
%----------------------------------------------------------------------------
